import 'package:flutter/material.dart';
import 'apps/homepage.dart';
import 'apps/signup.dart';
import 'apps/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Notes App",
      initialRoute: "login",
      routes: {
        "signup": (context) => const Signup(),
        "home": (context) => const HomePage(),
        "login": (context) => const Login(),
      },
    );
  }
}
