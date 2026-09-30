# Checklist di sviluppo — Bussola Amici

Riferimento architetturale: `docs/project_architecture.md`. Aggiornare le caselle man mano che si procede.

Ordine deciso: alpha con solo STUN (connessione diretta), TURN come ultimo step prima di un beta più ampio.

---

## Fase 0 — Setup base

- [X] Aggiungere dipendenze in `pubspec.yaml`: `firebase_auth`, `cloud_firestore`, `flutter_webrtc`, `flutter_compass`, `geolocator`
- [X] Configurare Firebase Auth anonimo (login automatico all'avvio app)
- [X] Verificare che `firebase_options.dart` sia allineato al progetto Firebase corretto
- [X] Aggiungere permessi piattaforma per posizione (Android `ACCESS_FINE_LOCATION`, iOS `NSLocationWhenInUseUsageDescription`)
- [X] Aggiungere permessi piattaforma per microfono/camera se richiesti da `flutter_webrtc` (anche se non usati, il plugin può richiederli su alcune piattaforme)

## Fase 1 — Firestore: signaling

- [X] Definire struttura `sessions/{sessionId}` con campi `offer` e `answer` (sdp, type)
- [X] Sottocollezione `offerCandidates` — un documento per candidato ICE (no array su campo unico)
- [X] Sottocollezione `answerCandidates` — stessa logica
- [X] Room persistente: struttura `rooms/{roomCode}` + sottocollezione `members/{uid}` (no array sul documento room)
- [X] Room code: generazione, ricerca room tramite codice, join (scrittura membro in `members`)
- [X] Leave: rimozione proprio documento da `members`; se era l'ultimo membro, eliminazione documento `rooms/{roomCode}`
- [X] `sessionId` deterministico per coppia: `{roomCode}_{uidA}_{uidB}` (uid ordinati alfabeticamente) — nessuna query aggiuntiva per scoprire le sessioni
- [X] Convenzione offerente: chi si unisce alla room dopo crea sempre l'offerta verso ciascun membro già presente; chi è già in room resta in ascolto e risponde (answer)
- [ ] Scrittura offerta SDP da parte di chi si unisce, verso ciascun membro esistente
- [ ] Scrittura risposta SDP da parte di ciascun membro esistente
- [ ] Listener su `docChanges` (tipo `added`) per candidati in arrivo su entrambe le sottocollezioni, per ciascuna sessione pairwise attiva
- [X] `RoomRepository` (create/search/join/leave) + orchestratore (`JoinRoomUseCase`/`LeaveRoomUseCase`) che usa `RoomRepository` e il `SessionRepository` esistente per aprire/chiudere le sessioni pairwise
- [X] Security rules Firestore:
  - [X] Un utente può leggere/scrivere solo sessioni e membership di room a cui appartiene
  - [X] Ricerca per room code limitata ai soli campi pubblici necessari
- [X] Pulizia: eliminazione documento sessione pairwise + sottocollezioni dopo connessione riuscita per quella coppia (`iceConnectionState == connected`) — il documento room non viene toccato da questa pulizia
- [X] Test manuale: 2-5 client (anche emulatori) completano join, offer/answer/candidati per ogni coppia e leave, verificando solo i dati su Firestore (senza WebRTC vero)

## Fase 2 — WebRTC P2P (solo STUN) — ALPHA

- [X] Creare `RTCPeerConnection` con `iceServers` contenente solo lo STUN pubblico (nessuna voce TURN per ora, ma struttura pronta per aggiungerla dopo)
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

- [ ] Schermata creazione/inserimento/condivisione room code
- [ ] Schermata bussola: un ago per ciascun membro connesso (heading da `flutter_compass` + bearing calcolato verso ognuno)
- [ ] Visualizzazione distanza da ciascun membro
- [ ] Gestione stati connessione per membro (in attesa, connessione in corso, connesso, errore/disconnesso)
- [ ] Gestione multi-amico: fino a 5 membri per room (mesh P2P completo, vedi architettura)
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
- [ ] Revisione security rules con casi limite (sessione pairwise abbandonata a metà, join/leave concorrenti sulla stessa room, ecc.)
