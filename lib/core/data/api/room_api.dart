import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/models/member_model.dart';
import 'package:compassly/core/data/models/room_model.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class RoomApi {
  final FirebaseFirestore _firebase;

  const RoomApi({required this._firebase});

  CollectionReference<RoomModel> get _rooms =>
      _firebase.collection('rooms').withConverter<RoomModel>(
        fromFirestore: (snapshot, _) =>
            RoomModel.fromJson({...?snapshot.data(), 'code': snapshot.id}),
        toFirestore: (model, _) => model.toJson(),
      );

  CollectionReference<MemberModel> _members(String code) => _firebase
      .collection('rooms')
      .doc(code)
      .collection('members')
      .withConverter<MemberModel>(
        fromFirestore: (snapshot, _) =>
            MemberModel.fromJson({...?snapshot.data(), 'uid': snapshot.id}),
        toFirestore: (model, _) => model.toJson(),
      );

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
      final room = await _rooms.doc(code).get();

      if (!room.exists) {
        return Left(FirestoreFailure.notFound(code));
      }

      return Right(room.data()!);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, List<MemberModel>>> fetchMembers({
    required String code,
  }) async {
    try {
      final snapshot = await _members(code).get();

      return Right(snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> join({
    required String code,
    required MemberModel member,
  }) async {
    try {
      await _members(code).doc(member.uid).set(member);
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
