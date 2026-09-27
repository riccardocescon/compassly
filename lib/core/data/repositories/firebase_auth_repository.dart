import 'package:compassly/core/domain/repositories/auth_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ribs_core/ribs_core.dart';

class FirebaseAuthRepository extends AuthRepository {
  final FirebaseAuth firebaseAuth;

  const FirebaseAuthRepository({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, User>> auth() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) return Right(user);

      final creds = await firebaseAuth.signInAnonymously();
      return Right(creds.user!);
    } catch (e) {
      return Left(AuthFailure.firebaseError(e.toString()));
    }
  }
}
