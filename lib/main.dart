import 'package:flutter/material.dart';
import 'package:get_started/screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Globe app',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const IntroScreen(),
    );
  }
}
