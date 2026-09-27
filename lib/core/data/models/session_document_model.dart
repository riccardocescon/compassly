import 'package:compassly/core/data/models/session_description_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_document_model.freezed.dart';
part 'session_document_model.g.dart';

@freezed
abstract class SessionDocumentModel with _$SessionDocumentModel {
  const factory SessionDocumentModel({
    @JsonKey(includeToJson: false) required String id,
    SessionDescriptionModel? offer,
    SessionDescriptionModel? answer,
  }) = _SessionDocumentModel;

  factory SessionDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDocumentModelFromJson(json);
}
