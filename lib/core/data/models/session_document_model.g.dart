// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionDocumentModel _$SessionDocumentModelFromJson(
  Map<String, dynamic> json,
) => _SessionDocumentModel(
  id: json['id'] as String,
  offer: json['offer'] == null
      ? null
      : SessionDescriptionModel.fromJson(json['offer'] as Map<String, dynamic>),
  answer: json['answer'] == null
      ? null
      : SessionDescriptionModel.fromJson(
          json['answer'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SessionDocumentModelToJson(
  _SessionDocumentModel instance,
) => <String, dynamic>{'offer': instance.offer, 'answer': instance.answer};
