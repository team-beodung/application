import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:convert';

import 'package:application/models/user.dart';

class HttpUserRepository implements UserRepository {
  final HttpClient httpClient;

  @override
  Future<User> login() async {
    final firebaseUser = await auth.signInAnonymously();

    return User(
      id: firebaseUser.user.uid,
      displayName: firebaseUser.user.displayName,
      photoUrl: firebaseUser.user.photoUrl,
    );
  }
}
