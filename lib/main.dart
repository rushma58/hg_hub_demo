import 'package:flutter/material.dart';
import 'package:hg_hub_demo/views/loginForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
