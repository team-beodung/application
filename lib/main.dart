import 'package:application/blocs/authenticatoin/authentication_bloc.dart';
import 'package:application/infrastructure/firebase_user_repository.dart';
import 'package:application/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  setUp();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const Application());
}

final getIt = GetIt.instance;
void setUp() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<UserRepository>(() => FirebaseUserRepository());
  getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc());
  getIt.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(),
    ),
  );
}
