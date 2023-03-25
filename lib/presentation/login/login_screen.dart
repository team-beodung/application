import 'package:application/blocs/authentication/signup_bloc.dart';
import 'package:application/blocs/authenticatoin/authentication_bloc.dart';
import 'package:application/widget/login_provider_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/widget/divider_with.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildHeader(context),
              const SizedBox(height: 8),
              _buildSignUpCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/free_logo.png'),
      width: 100,
      height: 100,
    );
  }

  Widget _buildSignUpCard(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) =>
          SnackBar(content: Text(state.emailValidatorMessage!)),
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(60),
        width: 400,
        child: Column(
          children: <Widget>[
            const Text(
              "Create a free account now",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSignupField(context, state),
            const SizedBox(height: 16),
            const DividerWith(
              divider: Divider(color: Colors.black),
              child: Text(
                "or sign in with",
                style: TextStyle(fontSize: 12, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            const LoginProviderButtonBar()
          ],
        ),
      ),
    );
  }

  Widget _buildSignupField(BuildContext context, AuthenticationState state) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            errorText: state.emailValidatorMessage,
          ),
          onChanged: (String value) {
            context
                .read<AuthenticationBloc>()
                .add(EmailChangedEvent(email: value));
          },
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
          ),
          onChanged: (String value) {},
        ),
        const SizedBox(height: 16),
        MaterialButton(
          color: Colors.blue,
          height: 48,
          minWidth: 220,
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
