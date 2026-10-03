import 'package:flutter_webrtc/flutter_webrtc.dart';

class PeerConnectionData {
  final String remoteMemberUid;
  final RTCPeerConnection connection;
  RTCDataChannel? dataChannel;

  PeerConnectionData({
    required this.remoteMemberUid,
    required this.connection,
    required this.dataChannel,
  });
}
