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
}
