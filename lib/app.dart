import 'package:application/presentation/home_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/login/login_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elin Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.indigoAccent),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.orange),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.purple),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen()
      },
    );
  }
}
