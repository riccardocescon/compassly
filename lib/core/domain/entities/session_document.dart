import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';

class SessionDocument {
  final String id;
  final SessionDescription offer;
  final SessionDescription answer;
  final List<ICECandidateDocument> offerCandidates;
  final List<ICECandidateDocument> answerCandidates;

  SessionDocument({
    required this.id,
    required this.offer,
    required this.answer,
    required this.offerCandidates,
    required this.answerCandidates,
  });
}
