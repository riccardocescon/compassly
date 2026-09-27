# Architettura App Bussola Amici — Riferimento per Code Review

> **Nota per Claude Code:** questo documento descrive l'architettura decisa per il progetto. Il compito è **verificare** che l'implementazione dell'utente sia coerente con quanto descritto qui, individuare bug, scostamenti o problemi — **non** scrivere codice, non proporre implementazioni complete, non fare refactoring non richiesti. L'utente sta sviluppando tutto in autonomia; usa questo documento come base di conoscenza per rispondere a domande puntuali e fare revisioni mirate. Puoi comunque rispondere a domande di progettazione o struttura del codice / pianificazione, finchè il discorso rimane teorico, non ci sono problemi

## Obiettivo del progetto

App Flutter che permette a due o più utenti di connettersi tramite un "codice amico" e vedere, tramite una bussola, la direzione e la distanza di ciascun amico connesso, con aggiornamento della posizione **ogni secondo**.

## Principio architetturale centrale

I dati di posizione (alta frequenza, 1/sec) **non passano mai da Firebase**. Viaggiano peer-to-peer via WebRTC DataChannel. Firebase serve solo per la fase iniziale di aggancio tra i due dispositivi (friend code + signaling), un'operazione sporadica e leggera. Questo tiene i costi bassissimi anche a scala, perché il traffico pesante bypassa completamente il BaaS.

## Componenti

| Componente | Ruolo | Note |
|---|---|---|
| Firebase Auth (anonimo) | Identità del dispositivo | Nessuna registrazione esplicita richiesta |
| Firestore | Friend code + signaling WebRTC | Regole di sicurezza dirette, **niente Cloud Functions** per questa parte |
| Cloud Function (Dart, HTTPS callable) | Genera credenziali TURN temporanee | Unico compito del backend custom. **Sperimentale**: supporta solo funzioni HTTPS/callable, non trigger su eventi Firestore/scheduler |
| STUN | Scoperta indirizzo IP pubblico | Server pubblico gratuito (es. Google) |
| TURN | Relay quando la connessione diretta non è possibile | Servizio gestito (es. Cloudflare Realtime) — **Firebase non offre un servizio TURN**, va usato un provider esterno o coturn self-hosted |
| flutter_webrtc | RTCPeerConnection + DataChannel | Trasporto P2P dei dati di posizione |
| flutter_compass | Heading del dispositivo | Client-side, nessun costo backend |
| Calcolo bearing/distanza | Formula di Haversine | Client-side, tra posizione propria e posizione ricevuta dell'amico |

## Flusso di connessione (signaling)

1. Entrambe le app chiamano la Cloud Function per ottenere credenziali TURN temporanee (username/password), da usare insieme all'URL STUN nella configurazione `iceServers` della `RTCPeerConnection`.
2. Utente A crea l'offerta SDP e la scrive in un documento `sessions/{sessionId}` su Firestore.
3. Utente A raccoglie i propri ICE candidate (WebRTC genera automaticamente tipi diversi — `host`, `srflx` via STUN, `relay` via TURN — non c'è logica applicativa da scrivere per distinguerli) e li scrive uno per uno nella sottocollezione `callerCandidates`.
4. Utente B legge l'offerta, crea la risposta SDP, la scrive nello stesso documento.
5. Utente B raccoglie e scrive i propri candidati in `calleeCandidates`.
6. Ogni peer ascolta la sottocollezione dei candidati dell'altro (listener su `docChanges` di tipo `added`) e li aggiunge alla propria `RTCPeerConnection` via `addCandidate`.
7. ICE prova automaticamente tutte le combinazioni di candidati e sceglie il percorso funzionante: diretto se possibile, altrimenti relay TURN. **Questa scelta è interamente gestita dallo stack WebRTC**, non c'è un controllo applicativo "se STUN fallisce, usa TURN" da implementare a mano — si osserva solo lo stato finale tramite `onIceConnectionState`.
8. Una volta che `iceConnectionState` è `connected`, il documento `sessions/{sessionId}` e le sue due sottocollezioni **devono essere eliminati** da entrambi i lati: non servono più, e lasciarli accumulare genera costi di storage/lettura inutili.
9. Da qui in poi, i dati di posizione viaggiano sul `DataChannel` P2P (diretto o via relay TURN — indifferente a livello applicativo), non toccano più Firestore.

## Struttura dati Firestore

```
sessions/{sessionId}
  ├── offer: { sdp, type }
  ├── answer: { sdp, type }
  ├── callerCandidates/ (sottocollezione, 1 documento per candidato ICE)
  └── calleeCandidates/ (sottocollezione, 1 documento per candidato ICE)
```

Punti da verificare in review:
- I candidati vengono scritti come documenti singoli in una sottocollezione (per supportare il trickle ICE), **non** accumulati in un array su un unico campo.
- Il documento di sessione e le sottocollezioni vengono ripuliti dopo la connessione riuscita.
- Le regole di sicurezza Firestore impediscono a un utente di leggere/scrivere sessioni che non gli appartengono, e limitano la ricerca per friend code ai soli campi pubblici necessari.

## Cosa NON deve esserci nel codice

- Nessuna scrittura di posizione GPS su Firestore/Realtime Database (deve passare solo dal DataChannel WebRTC).
- Nessun server WebSocket custom per il signaling (sostituito da Firestore).
- Nessuna logica applicativa che tenta di "rilevare se STUN ha fallito" prima di passare a TURN — è gestito da ICE stesso fornendo entrambi i server fin dall'inizio.
- Nessun riferimento a un "TURN di Firebase" — non esiste; il provider TURN è un servizio esterno separato.

## Note sui costi (riferimento, non vincolante)

Per una scala di circa 10.000 utenti mensili / 3.000 attivi al giorno, la stima è di pochi dollari al mese in totale (Firestore per il solo signaling, Cloud Functions e TURN gestito entrambi entro i rispettivi free tier), proprio perché il traffico ad alta frequenza (posizione) non tocca mai Firebase.