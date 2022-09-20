import 'package:elective/view/joke_screen.dart';
import 'package:flutter/material.dart';

class ChuckNorrisApp extends StatelessWidget {
  const ChuckNorrisApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokeScreen(),
    );
  }
}
