import 'package:compassly/core/failures/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ribs_core/ribs_core.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<Either<AuthFailure, User>> auth();
}
