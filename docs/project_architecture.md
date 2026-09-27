# Architettura App Bussola Amici — Riferimento per Code Review

> **Nota per Claude Code:** questo documento descrive l'architettura decisa per il progetto. Il compito è **verificare** che l'implementazione dell'utente sia coerente con quanto descritto qui, individuare bug, scostamenti o problemi — **non** scrivere codice, non proporre implementazioni complete, non fare refactoring non richiesti. L'utente sta sviluppando tutto in autonomia; usa questo documento come base di conoscenza per rispondere a domande puntuali e fare revisioni mirate. Puoi comunque rispondere a domande di progettazione o struttura del codice / pianificazione, finchè il discorso rimane teorico, non ci sono problemi

## Obiettivo del progetto

App Flutter che permette a un gruppo di utenti (fino a **5 membri**, limite iniziale) di connettersi tramite un codice ("room code", persistente, senza scadenza) e vedere, tramite una bussola, la direzione e la distanza di ciascun membro connesso, con aggiornamento della posizione **ogni secondo**.

## Principio architetturale centrale

I dati di posizione (alta frequenza, 1/sec) **non passano mai da Firebase**. Viaggiano peer-to-peer via WebRTC DataChannel. Firebase serve solo per la fase iniziale di aggancio tra i dispositivi (room code + signaling) e per tenere traccia di chi è nella room, entrambe operazioni sporadiche e leggere. Questo tiene i costi bassissimi anche a scala, perché il traffico pesante bypassa completamente il BaaS.

Con più di due membri non esiste un relay/SFU centrale: ogni membro apre una connessione P2P diretta con ciascun altro membro (mesh completo). Con il limite di 5 membri, ogni dispositivo gestisce al massimo 4 `RTCPeerConnection` contemporanee — accettabile senza cambi architetturali. Un limite più alto (ipotesi futura dietro paywall) richiederebbe di rivalutare l'architettura (es. introdurre un relay), non è coperto da questo documento.

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

## Room e membership (friend code)

- `rooms/{roomCode}` è un documento **persistente**, senza timeout: creato quando il primo utente genera il codice, esiste finché c'è almeno un membro.
- I membri vivono in una sottocollezione `rooms/{roomCode}/members/{uid}` (un documento per membro, non un array sul documento room — stesso motivo delle sottocollezioni `offerCandidates`/`answerCandidates`: join/leave di membri diversi sono scritture concorrenti indipendenti).
- **Join:** l'utente cerca la room per codice, legge i membri già presenti, scrive il proprio documento in `members`, poi stabilisce una sessione WebRTC pairwise (vedi sotto) con ciascun membro esistente.
- **Leave (disconnessione):** l'utente rimuove il proprio documento da `members` e chiude localmente le proprie `RTCPeerConnection`. Se era l'ultimo membro rimasto, elimina anche il documento `rooms/{roomCode}`.
- Le security rules limitano la ricerca per room code ai soli campi pubblici necessari (stesso principio già previsto per il friend code), e impediscono di scrivere `members` per una room a cui non si appartiene.

## Flusso di connessione (signaling)

Il signaling pairwise (offer/answer/candidates) descritto sotto è la stessa identica primitiva sia con 2 che con N membri: con N membri, ogni nuovo ingresso nella room ripete questo flusso una volta per ciascun membro già presente (mesh completo, non un singolo scambio).

1. Entrambe le app chiamano la Cloud Function per ottenere credenziali TURN temporanee (username/password), da usare insieme all'URL STUN nella configurazione `iceServers` della `RTCPeerConnection`.
2. **Convenzione per evitare glare:** chi si unisce alla room **dopo** è sempre l'offerente verso i membri già presenti. Chi è già in room sta in ascolto (listener su `members`, evento `added`) e, quando nota un nuovo membro, si aspetta un'offerta da lui — non ne crea una propria.
3. Il `sessionId` della sessione pairwise è **deterministico**: `{roomCode}_{uidA}_{uidB}` con i due uid ordinati alfabeticamente. Questo permette a entrambi i lati di calcolare autonomamente dove leggere/scrivere, senza query aggiuntive su Firestore né campi extra per "trovare" le proprie sessioni.
4. L'offerente crea l'offerta SDP e la scrive nel documento `sessions/{sessionId}` su Firestore.
5. L'offerente raccoglie i propri ICE candidate (WebRTC genera automaticamente tipi diversi — `host`, `srflx` via STUN, `relay` via TURN — non c'è logica applicativa da scrivere per distinguerli) e li scrive uno per uno nella sottocollezione `offerCandidates`.
6. L'altro membro della coppia legge l'offerta (sapendo calcolare lo stesso `sessionId`), crea la risposta SDP, la scrive nello stesso documento.
7. Quel membro raccoglie e scrive i propri candidati in `answerCandidates`.
8. Ogni peer della coppia ascolta la sottocollezione dei candidati dell'altro (listener su `docChanges` di tipo `added`) e li aggiunge alla propria `RTCPeerConnection` via `addCandidate`.
9. ICE prova automaticamente tutte le combinazioni di candidati e sceglie il percorso funzionante: diretto se possibile, altrimenti relay TURN. **Questa scelta è interamente gestita dallo stack WebRTC**, non c'è un controllo applicativo "se STUN fallisce, usa TURN" da implementare a mano — si osserva solo lo stato finale tramite `onIceConnectionState`.
10. Una volta che `iceConnectionState` è `connected` per quella coppia, il documento `sessions/{sessionId}` e le sue due sottocollezioni **devono essere eliminati** da entrambi i lati: non servono più, e lasciarli accumulare genera costi di storage/lettura inutili.
11. Da qui in poi, i dati di posizione tra quella coppia viaggiano sul `DataChannel` P2P (diretto o via relay TURN — indifferente a livello applicativo), non toccano più Firestore.

## Struttura dati Firestore

```
rooms/{roomCode}
  └── members/{uid} (sottocollezione, 1 documento per membro attuale della room)

sessions/{roomCode}_{uidA}_{uidB}   (uidA, uidB ordinati alfabeticamente)
  ├── offer: { sdp, type }
  ├── answer: { sdp, type }
  ├── offerCandidates/ (sottocollezione, 1 documento per candidato ICE)
  └── answerCandidates/ (sottocollezione, 1 documento per candidato ICE)
```

Punti da verificare in review:
- I candidati vengono scritti come documenti singoli in una sottocollezione (per supportare il trickle ICE), **non** accumulati in un array su un unico campo.
- I membri di una room vivono in una sottocollezione (`members/{uid}`), **non** in un array sul documento `rooms/{roomCode}`.
- Il `sessionId` è calcolato deterministicamente da `roomCode` + i due uid ordinati, non generato casualmente.
- Il documento di sessione pairwise e le sue sottocollezioni vengono ripuliti dopo la connessione riuscita **per quella coppia** — il documento `rooms/{roomCode}` invece resta finché c'è almeno un membro.
- Le regole di sicurezza Firestore impediscono a un utente di leggere/scrivere sessioni o membership di room a cui non appartiene, e limitano la ricerca per room code ai soli campi pubblici necessari.

## Cosa NON deve esserci nel codice

- Nessuna scrittura di posizione GPS su Firestore/Realtime Database (deve passare solo dal DataChannel WebRTC).
- Nessun server WebSocket custom per il signaling (sostituito da Firestore).
- Nessuna logica applicativa che tenta di "rilevare se STUN ha fallito" prima di passare a TURN — è gestito da ICE stesso fornendo entrambi i server fin dall'inizio.
- Nessun riferimento a un "TURN di Firebase" — non esiste; il provider TURN è un servizio esterno separato.
- Nessun relay/SFU centrale per instradare i dati di posizione tra i membri di una room — il mesh è P2P diretto fra ogni coppia, anche con più di 2 membri.
- Nessuna logica che negozia "chi offre per primo" a runtime — è fissa per convenzione (chi entra dopo offre) e derivabile dal solo evento di join, non richiede scambi aggiuntivi.

## Note sui costi (riferimento, non vincolante)

Per una scala di circa 10.000 utenti mensili / 3.000 attivi al giorno, la stima è di pochi dollari al mese in totale (Firestore per il solo signaling, Cloud Functions e TURN gestito entrambi entro i rispettivi free tier), proprio perché il traffico ad alta frequenza (posizione) non tocca mai Firebase.