# Checklist di sviluppo — Bussola Amici

Riferimento architetturale: `docs/project_architecture.md`. Aggiornare le caselle man mano che si procede.

Ordine deciso: alpha con solo STUN (connessione diretta), TURN come ultimo step prima di un beta più ampio.

---

## Fase 0 — Setup base

- [ ] Aggiungere dipendenze in `pubspec.yaml`: `firebase_auth`, `cloud_firestore`, `flutter_webrtc`, `flutter_compass`, `geolocator`
- [ ] Configurare Firebase Auth anonimo (login automatico all'avvio app)
- [ ] Verificare che `firebase_options.dart` sia allineato al progetto Firebase corretto
- [ ] Aggiungere permessi piattaforma per posizione (Android `ACCESS_FINE_LOCATION`, iOS `NSLocationWhenInUseUsageDescription`)
- [ ] Aggiungere permessi piattaforma per microfono/camera se richiesti da `flutter_webrtc` (anche se non usati, il plugin può richiederli su alcune piattaforme)

## Fase 1 — Firestore: signaling

- [ ] Definire struttura `sessions/{sessionId}` con campi `offer` e `answer` (sdp, type)
- [ ] Sottocollezione `callerCandidates` — un documento per candidato ICE (no array su campo unico)
- [ ] Sottocollezione `calleeCandidates` — stessa logica
- [ ] Logica "friend code": generazione codice, ricerca sessione tramite codice, join
- [ ] Scrittura offerta SDP da parte del creatore sessione
- [ ] Scrittura risposta SDP da parte di chi si unisce
- [ ] Listener su `docChanges` (tipo `added`) per candidati in arrivo su entrambe le sottocollezioni
- [ ] Security rules Firestore:
  - [ ] Un utente può leggere/scrivere solo sessioni a cui appartiene
  - [ ] Ricerca per friend code limitata ai soli campi pubblici necessari
- [ ] Pulizia: eliminazione documento sessione + sottocollezioni dopo connessione riuscita (`iceConnectionState == connected`)
- [ ] Test manuale: due client (anche due emulatori) completano offer/answer/candidati senza WebRTC vero, solo verificando i dati su Firestore

## Fase 2 — WebRTC P2P (solo STUN) — ALPHA

- [ ] Creare `RTCPeerConnection` con `iceServers` contenente solo lo STUN pubblico (nessuna voce TURN per ora, ma struttura pronta per aggiungerla dopo)
- [ ] Creare `DataChannel` per invio posizione
- [ ] Collegare generazione/raccolta ICE candidate locali alla scrittura su Firestore (Fase 1)
- [ ] Collegare candidati remoti ricevuti da Firestore a `addCandidate`
- [ ] Verificare `onIceConnectionState` → arriva a `connected` su rete locale/WiFi
- [ ] Invio posizione GPS (lat/lon) via DataChannel, aggiornamento ogni secondo
- [ ] Ricezione posizione amico via DataChannel, nessuna scrittura su Firestore per questi dati
- [ ] Calcolo bearing/distanza (Haversine) client-side tra posizione propria e posizione ricevuta
- [ ] Test end-to-end su due dispositivi reali sulla stessa rete WiFi
- [ ] Nota: su reti diverse (WiFi vs cellulare) la connessione potrebbe fallire senza TURN — atteso in questa fase, non è un bug

## Fase 3 — UI

- [ ] Schermata inserimento/condivisione friend code
- [ ] Schermata bussola: ago che punta verso l'amico (heading da `flutter_compass` + bearing calcolato)
- [ ] Visualizzazione distanza dall'amico
- [ ] Gestione stati connessione (in attesa, connessione in corso, connesso, errore/disconnesso)
- [ ] Gestione multi-amico (se previsto) o singolo amico per la versione alpha
- [ ] Rimuovere/sostituire `test_page.dart` con le schermate reali

## Fase 4 — TURN (Cloud Function) — prima del beta

- [ ] Scrivere Cloud Function (Dart, HTTPS callable) che genera credenziali TURN temporanee
- [ ] Integrare provider TURN esterno (es. Cloudflare Realtime) — nessun TURN Firebase, non esiste
- [ ] Chiamare la function all'avvio della connessione, prima di creare `RTCPeerConnection`
- [ ] Aggiungere le credenziali TURN ottenute in coda alla lista `iceServers` (già insieme allo STUN)
- [ ] Test forzando il path relay (es. bloccando UDP diretto o usando reti con NAT simmetrico/cellulare) per verificare che TURN venga effettivamente usato
- [ ] Verificare che non ci sia logica applicativa che tenta di "rilevare se STUN ha fallito" — deve essere gestito solo da ICE

## Fase 5 — Hardening / rifinitura (facoltativa, post-alpha)

- [ ] Gestione riconnessione se `iceConnectionState` passa a `disconnected`/`failed`
- [ ] Timeout su sessioni Firestore non completate (nessuno risponde all'offerta)
- [ ] Monitoraggio costi Firestore/Cloud Functions/TURN a scala reale
- [ ] Revisione security rules con casi limite (sessione scaduta, friend code riutilizzato, ecc.)
