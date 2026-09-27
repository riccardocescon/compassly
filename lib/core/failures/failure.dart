sealed class Failure {
  final String message;

  const Failure({required this.message});
}

class AuthFailure extends Failure {
  const AuthFailure._({required super.message});

  factory AuthFailure.firebaseError(String error) =>
      AuthFailure._(message: error);
}
