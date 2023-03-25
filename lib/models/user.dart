class UserEntity {
  String uid;
  String email;
  String photoUrl;
  String displayName;

  UserEntity({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.displayName,
  });
}

abstract class UserRepository {
  Future<UserEntity> signInWithEmailAndPassword();
  Future<void> signUpWithEmailAndPassword(String email, String password);
}
