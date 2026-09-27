import 'package:compassly/core/domain/entities/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
abstract class RoomModel with _$RoomModel {
  const factory RoomModel({
    @JsonKey(includeToJson: false) required String code,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  factory RoomModel.fromEntity(Room entity) => RoomModel(code: entity.code);
}
