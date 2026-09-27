import 'package:compassly/core/data/models/session_description_model.dart';
import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_document_model.freezed.dart';
part 'session_document_model.g.dart';

@freezed
abstract class SessionDocumentModel with _$SessionDocumentModel {
  const SessionDocumentModel._();

  const factory SessionDocumentModel({
    @JsonKey(includeToJson: false) required String id,
    SessionDescriptionModel? offer,
    SessionDescriptionModel? answer,
  }) = _SessionDocumentModel;

  factory SessionDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDocumentModelFromJson(json);

  /// offerCandidates/answerCandidates non fanno parte di questo documento
  /// (arrivano dagli stream separati su quelle sottocollezioni), quindi qui
  /// vengono passati da chi assembla il SessionDocument completo.
  SessionDocument toEntity({
    List<ICECandidateDocument> offerCandidates = const [],
    List<ICECandidateDocument> answerCandidates = const [],
  }) => SessionDocument(
    id: id,
    offer: offer?.toEntity(),
    answer: answer?.toEntity(),
    offerCandidates: offerCandidates,
    answerCandidates: answerCandidates,
  );
}
