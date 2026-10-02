sealed class Failure {
  final String message;

  const Failure({required this.message});
}

class AuthFailure extends Failure {
  const AuthFailure._({required super.message});

  factory AuthFailure.firebaseError(String error) =>
      AuthFailure._(message: error);
}

class FirestoreFailure extends Failure {
  const FirestoreFailure._({required super.message});

  factory FirestoreFailure.firebaseError(String error) =>
      FirestoreFailure._(message: error);

  factory FirestoreFailure.notFound(String entity) =>
      FirestoreFailure._(message: '$entity not found');
}

class DataFailure extends Failure {
  const DataFailure._({required super.message});

  factory DataFailure.preprocess(String error) => DataFailure._(message: error);
}

class SessionFailure extends Failure {
  const SessionFailure._({required super.message});

  factory SessionFailure.closed(String message) =>
      SessionFailure._(message: message);

  factory SessionFailure.timeout(String message) =>
      SessionFailure._(message: message);

  factory SessionFailure.catched(String error) =>
      SessionFailure._(message: error);
}
