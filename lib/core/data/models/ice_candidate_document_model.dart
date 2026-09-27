import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ice_candidate_document_model.freezed.dart';
part 'ice_candidate_document_model.g.dart';

@freezed
abstract class ICECandidateDocumentModel with _$ICECandidateDocumentModel {
  const factory ICECandidateDocumentModel({
    @JsonKey(includeToJson: false) required String id,
    required String sdpMid,
    required int sdpMLineIndex,
    required String candidate,
  }) = _ICECandidateDocumentModel;

  factory ICECandidateDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$ICECandidateDocumentModelFromJson(json);

  factory ICECandidateDocumentModel.fromEntity(
    ICECandidateDocument entity,
  ) => ICECandidateDocumentModel(
    id: entity.id,
    sdpMid: entity.sdpMid,
    sdpMLineIndex: entity.sdpMLineIndex,
    candidate: entity.candidate,
  );
}
