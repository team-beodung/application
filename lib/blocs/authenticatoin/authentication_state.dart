import 'package:equatable/equatable.dart';

enum AuthenticationStatus { loading, success, failure }

class AuthenticationState extends Equatable {
  final String email;
  final String? emailValidatorMessage;
  final String password;
  final String? passwordValidatorMessage;
  final AuthenticationStatus status;

  const AuthenticationState({
    this.email = '',
    this.emailValidatorMessage,
    this.password = '',
    this.passwordValidatorMessage,
    this.status = AuthenticationStatus.loading,
  });

  AuthenticationState copyWith({
    String? email,
    String? emailValidatorMessage,
    String? password,
    String? passwordValidatorMessage,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      email: email ?? this.email,
      emailValidatorMessage:
          emailValidatorMessage ?? this.emailValidatorMessage,
      password: password ?? this.password,
      passwordValidatorMessage:
          passwordValidatorMessage ?? this.passwordValidatorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
