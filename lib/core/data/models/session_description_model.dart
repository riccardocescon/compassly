import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_description_model.freezed.dart';
part 'session_description_model.g.dart';

@freezed
abstract class SessionDescriptionModel with _$SessionDescriptionModel {
  const SessionDescriptionModel._();

  const factory SessionDescriptionModel({
    required String sdp,
    required String type,
  }) = _SessionDescriptionModel;

  factory SessionDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDescriptionModelFromJson(json);

  factory SessionDescriptionModel.fromEntity(SessionDescription entity) =>
      SessionDescriptionModel(sdp: entity.sdp, type: entity.type);

  SessionDescription toEntity() => SessionDescription(sdp: sdp, type: type);
}
