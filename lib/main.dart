import 'package:daily_plan_tracker/common/constants.dart';
import 'package:daily_plan_tracker/initialize.dart';
import 'package:daily_plan_tracker/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily time tracker",
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Initialize(),
    );
  }
}
