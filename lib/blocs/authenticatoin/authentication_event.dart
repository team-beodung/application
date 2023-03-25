import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'authentication_state.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressedEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpButtonPressedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class EmailChangedEvent extends AuthenticationEvent {
  final String email;

  const EmailChangedEvent({required this.email});

  static void Function(EmailChangedEvent, Emitter<AuthenticationState>)
      handleEmailChangedEvent(AuthenticationState state) => (
            EmailChangedEvent event,
            Emitter<AuthenticationState> emit,
          ) {
            emit(state.copyWith(
                email: event.email, emailValidatorMessage: event.email));
          };

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChangedEvent extends AuthenticationEvent {
  final String password;

  const SignUpPasswordChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}
