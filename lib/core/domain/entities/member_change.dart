import 'package:compassly/core/domain/entities/member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_change.freezed.dart';

@freezed
sealed class MemberChange with _$MemberChange {
  const factory MemberChange.joined({required Member member}) = MemberJoined;
  const factory MemberChange.existing({required Member member}) =
      MemberExisting;
  const factory MemberChange.left({required Member member}) = MemberLeft;
}
