import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/models/member_model.dart';
import 'package:compassly/core/data/models/room_model.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class RoomApi {
  final FirebaseFirestore _firebase;

  const RoomApi({required this._firebase});

  Future<Either<FirestoreFailure, void>> create({
    required String code,
    required String roomName,
  }) async {
    try {
      await _firebase.collection('rooms').doc(code).set({
        'createdAt': FieldValue.serverTimestamp(),
      });
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, RoomModel>> search({
    required String code,
  }) async {
    try {
      final room = await _firebase.collection('rooms').doc(code).get();

      if (!room.exists) {
        return Left(FirestoreFailure.notFound(code));
      }

      return Right(RoomModel.fromJson(room.data()!));
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, List<MemberModel>>> fetchMembers({
    required String code,
  }) async {
    try {
      final snapshot = await _firebase
          .collection('rooms')
          .doc(code)
          .collection('members')
          .get();

      final members = snapshot.docs
          .map((doc) => MemberModel.fromJson(doc.data()))
          .toList();

      return Right(members);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> join({
    required String code,
    required MemberModel member,
  }) async {
    try {
      await _firebase
          .collection('rooms')
          .doc(code)
          .collection('members')
          .doc(member.uid)
          .set(member.toJson());
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> leave({
    required String code,
    required String uid,
  }) async {
    try {
      await _firebase
          .collection('rooms')
          .doc(code)
          .collection('members')
          .doc(uid)
          .delete();
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> delete({required String code}) async {
    try {
      await _firebase.collection('rooms').doc(code).delete();
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }
}
