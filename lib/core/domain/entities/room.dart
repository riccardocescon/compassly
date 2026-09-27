import 'package:compassly/core/domain/entities/member.dart';

class Room {
  final String code;
  final List<Member> members;

  const Room({required this.code, required this.members});
}
