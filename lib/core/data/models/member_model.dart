import 'package:compassly/core/domain/entities/member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
abstract class MemberModel with _$MemberModel {
  const factory MemberModel({
    @JsonKey(includeToJson: false) required String uid,
    required String name,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  factory MemberModel.fromEntity(Member entity, {required String uid}) =>
      MemberModel(uid: uid, name: entity.name);
}
