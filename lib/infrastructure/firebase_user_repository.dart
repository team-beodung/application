import 'package:firebase_auth/firebase_auth.dart';

import 'package:application/models/user.dart';

import '../main.dart';

class FirebaseUserRepository implements UserRepository {
  final firebaseAuth = getIt<FirebaseAuth>();

  @override
  Future<UserEntity> signInWithEmailAndPassword() async {
    final userCredential = await firebaseAuth.signInAnonymously();
    final user = userCredential.user!;

    return UserEntity(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName!,
      photoUrl: user.photoURL!,
    );
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      String email, String paassword) async {
    final _ = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: paassword,
    );
  }
}
