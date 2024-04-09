import 'package:flutter/material.dart';

import 'package:mvp/dependency_injection.dart';
import 'package:mvp/home_screen.dart';

void main() async {
  Injector.configure(Flavour.PRODUCTION);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        body: Home_Page(),
      ),
    );
  }
}
