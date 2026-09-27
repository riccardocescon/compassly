import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/models/member_model.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionApi {
  final FirebaseFirestore _firebase;

  const SessionApi({required this._firebase});

  Future<Either<FirestoreFailure, void>> create({
    required String sessionId,
  }) async {
    try {
      await _firebase.collection('sessions').doc(sessionId).set({
        'createdAt': FieldValue.serverTimestamp(),
      });
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> delete({
    required String sessionId,
  }) async {
    try {
      await _firebase.collection('sessions').doc(sessionId).delete();
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }
}
