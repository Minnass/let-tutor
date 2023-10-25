import 'package:flutter/material.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/Authentication/registration.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RegisterScreen(),
        ),
      ),
    );
  }
}
