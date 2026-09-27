import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/models/ice_candidate_document_model.dart';
import 'package:compassly/core/data/models/session_description_model.dart';
import 'package:compassly/core/data/models/session_document_model.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionApi {
  final FirebaseFirestore _firebase;

  const SessionApi({required this._firebase});

  CollectionReference<SessionDocumentModel> get _sessions =>
      _firebase.collection('sessions').withConverter<SessionDocumentModel>(
        fromFirestore: (snapshot, _) => SessionDocumentModel.fromJson({
          ...?snapshot.data(),
          'id': snapshot.id,
        }),
        toFirestore: (model, _) => model.toJson(),
      );

  CollectionReference<ICECandidateDocumentModel> _offerCandidates(
    String sessionId,
  ) => _firebase
      .collection('sessions')
      .doc(sessionId)
      .collection('offerCandidates')
      .withConverter<ICECandidateDocumentModel>(
        fromFirestore: (snapshot, _) => ICECandidateDocumentModel.fromJson({
          ...?snapshot.data(),
          'id': snapshot.id,
        }),
        toFirestore: (model, _) => model.toJson(),
      );

  CollectionReference<ICECandidateDocumentModel> _answerCandidates(
    String sessionId,
  ) => _firebase
      .collection('sessions')
      .doc(sessionId)
      .collection('answerCandidates')
      .withConverter<ICECandidateDocumentModel>(
        fromFirestore: (snapshot, _) => ICECandidateDocumentModel.fromJson({
          ...?snapshot.data(),
          'id': snapshot.id,
        }),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<Either<FirestoreFailure, void>> create({
    required String sessionId,
  }) async {
    try {
      await _firebase.collection('sessions').doc(sessionId).set({
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> writeOffer({
    required String sessionId,
    required SessionDescriptionModel offer,
  }) async {
    try {
      await _firebase.collection('sessions').doc(sessionId).update({
        'offer': offer.toJson(),
      });
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> writeAnswer({
    required String sessionId,
    required SessionDescriptionModel answer,
  }) async {
    try {
      await _firebase.collection('sessions').doc(sessionId).update({
        'answer': answer.toJson(),
      });
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Stream<Either<FirestoreFailure, SessionDocumentModel>> watchSession({
    required String sessionId,
  }) async* {
    try {
      final snapshots = _sessions.doc(sessionId).snapshots();
      await for (final doc in snapshots) {
        if (doc.exists) {
          yield Right(doc.data()!);
        }
      }
    } catch (e) {
      yield Left(FirestoreFailure.firebaseError(e.toString()));
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

  Future<Either<FirestoreFailure, void>> addOfferCandidate({
    required String sessionId,
    required ICECandidateDocumentModel candidate,
  }) async {
    try {
      await _offerCandidates(sessionId).add(candidate);
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Stream<Either<FirestoreFailure, List<ICECandidateDocumentModel>>>
  watchOfferCandidates({required String sessionId}) async* {
    try {
      final snapshots = _offerCandidates(sessionId).snapshots();
      await for (final snapshot in snapshots) {
        final addedDocs = snapshot.docChanges
            .where((change) => change.type == DocumentChangeType.added)
            .map((change) => change.doc.data()!)
            .toList();
        yield Right(addedDocs);
      }
    } catch (e) {
      yield Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<Either<FirestoreFailure, void>> addAnswerCandidate({
    required String sessionId,
    required ICECandidateDocumentModel candidate,
  }) async {
    try {
      await _answerCandidates(sessionId).add(candidate);
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Stream<Either<FirestoreFailure, List<ICECandidateDocumentModel>>>
  watchAnswerCandidates({required String sessionId}) async* {
    try {
      final snapshots = _answerCandidates(sessionId).snapshots();
      await for (final snapshot in snapshots) {
        final addedDocs = snapshot.docChanges
            .where((change) => change.type == DocumentChangeType.added)
            .map((change) => change.doc.data()!)
            .toList();
        yield Right(addedDocs);
      }
    } catch (e) {
      yield Left(FirestoreFailure.firebaseError(e.toString()));
    }
  }

  Future<void> clearAllCandidates({required String sessionId}) async {
    try {
      final offerSnapshot = await _offerCandidates(sessionId).get();
      for (final doc in offerSnapshot.docs) {
        doc.reference.delete();
      }

      final answerSnapshot = await _answerCandidates(sessionId).get();
      for (final doc in answerSnapshot.docs) {
        doc.reference.delete();
      }
    } catch (e) {
      log('Error clearing candidates: ${e.toString()}');
    }
  }
}
