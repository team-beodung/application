import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginProviderButtonBar extends StatelessWidget {
  const LoginProviderButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      buttonHeight: 48,
      buttonMinWidth: 220,
      children: <Widget>[
        SignInButton(
          Buttons.GoogleDark,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        SignInButtonBuilder(
          text: 'Sign in with Kakao',
          icon: Icons.email,
          onPressed: () {},
          backgroundColor: Colors.orange,
          width: 220,
          height: 48,
        ),
      ],
    );
  }
}
