import 'dart:math';

import 'package:uuid/uuid.dart';

class Generators {
  static String generateCode() {
    const uuid = Uuid();
    return uuid.v4().substring(0, 6).toUpperCase();
  }

  static String generateName() {
    const words = [
      'Lion',
      'Tiger',
      'Bear',
      'Elephant',
      'Giraffe',
      'Zebra',
      'Monkey',
      'Kangaroo',
      'Koala',
      'Panda',
      'Dolphin',
      'Eagle',
      'Fox',
      'Wolf',
    ];

    final random = Random();
    final word = words[random.nextInt(words.length)];
    return 'Room $word';
  }

  static String generateSessionId({
    required String roomCode,
    required String uidA,
    required String uidB,
  }) {
    final firstUid = uidA.compareTo(uidB) < 0 ? uidA : uidB;
    final secondUid = uidA.compareTo(uidB) < 0 ? uidB : uidA;
    return '${roomCode}_${firstUid}_$secondUid';
  }
}
