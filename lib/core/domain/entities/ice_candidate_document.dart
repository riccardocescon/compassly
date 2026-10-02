import 'package:flutter_webrtc/flutter_webrtc.dart';

class ICECandidateDocument {
  final String id;
  final String sdpMid;
  final int sdpMLineIndex;
  final String candidate;

  ICECandidateDocument({
    required this.id,
    required this.sdpMid,
    required this.sdpMLineIndex,
    required this.candidate,
  });

  static ICECandidateDocument? fromRTCIceCandidate(RTCIceCandidate source) {
    final (sdpMid, sdpMLineIndex, candidate) = (
      source.sdpMid,
      source.sdpMLineIndex,
      source.candidate,
    );
    if (sdpMid == null ||
        sdpMLineIndex == null ||
        candidate == null ||
        candidate.isEmpty) {
      return null;
    }

    return ICECandidateDocument(
      id: '',
      sdpMid: sdpMid,
      sdpMLineIndex: sdpMLineIndex,
      candidate: candidate,
    );
  }

  RTCIceCandidate toIceCandidate() =>
      RTCIceCandidate(candidate, sdpMid, sdpMLineIndex);
}
