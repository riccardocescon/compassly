// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_candidate_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ICECandidateDocumentModel _$ICECandidateDocumentModelFromJson(
  Map<String, dynamic> json,
) => _ICECandidateDocumentModel(
  id: json['id'] as String,
  sdpMid: json['sdpMid'] as String,
  sdpMLineIndex: (json['sdpMLineIndex'] as num).toInt(),
  candidate: json['candidate'] as String,
);

Map<String, dynamic> _$ICECandidateDocumentModelToJson(
  _ICECandidateDocumentModel instance,
) => <String, dynamic>{
  'sdpMid': instance.sdpMid,
  'sdpMLineIndex': instance.sdpMLineIndex,
  'candidate': instance.candidate,
};
