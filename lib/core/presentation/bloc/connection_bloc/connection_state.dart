part of 'connection_bloc.dart';

@freezed
sealed class ConnectionState with _$ConnectionState {
  const factory ConnectionState.init() = _Init;

  /// Stato della connessione P2P verso ciascun membro, indicizzato per uid.
  const factory ConnectionState.data({
    required Map<String, PeerStatus> peers,
  }) = _Data;
}
