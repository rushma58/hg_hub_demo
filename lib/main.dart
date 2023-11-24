import 'package:flutter/material.dart';
import 'package:hg_hub_demo/views/homePage.dart';
import 'package:hg_hub_demo/views/leaveRequestPage.dart';
import 'package:hg_hub_demo/views/loginForm.dart';
import 'package:hg_hub_demo/views/reportsListPage.dart';
import 'package:hg_hub_demo/views/splashPage.dart';

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
      //home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginForm(),
        '/home': (context) => const HomePage(),
        '/leaveRequest': (context) => const LeaveRequestForm(),
        '/reportList': (context) => const ReportListPage(),
      },
    );
  }
}
