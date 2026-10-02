import 'package:compassly/core/failures/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'peer_status.freezed.dart';

@freezed
sealed class PeerStatus with _$PeerStatus {
  const factory PeerStatus.connecting() = PeerConnecting;
  const factory PeerStatus.connected() = PeerConnected;
  const factory PeerStatus.failed({required Failure failure}) = PeerFailed;
}
