import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../models/user.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final userRepository = GetIt.I<UserRepository>();
  final logger = GetIt.I<Logger>();

  AuthenticationBloc() : super(const AuthenticationState()) {
    on<SignUpButtonPressedEvent>(handleSignUpAccountEvent);
    on<EmailChangedEvent>(EmailChangedEvent.handleEmailChangedEvent(state));
    on<SignUpPasswordChangedEvent>(handlePasswordChangedEvent);
  }

  void handleSignUpAccountEvent(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await userRepository.signUpWithEmailAndPassword(
        state.email,
        state.password,
      );
      emit(state.copyWith(status: AuthenticationStatus.success));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return emit(state.copyWith(
            emailValidatorMessage: '이미 등록된 이메일 입니다.',
            status: AuthenticationStatus.failure,
          ));
        default:
          return logger.e(e);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  void handlePasswordChangedEvent(
      SignUpPasswordChangedEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(email: event.password));
  }
}
