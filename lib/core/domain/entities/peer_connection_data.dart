import 'package:flutter_webrtc/flutter_webrtc.dart';

class PeerConnectionData {
  final String remoteMemberUid;
  final RTCPeerConnection connection;
  final RTCDataChannel dataChannel;

  const PeerConnectionData({
    required this.remoteMemberUid,
    required this.connection,
    required this.dataChannel,
  });
}
