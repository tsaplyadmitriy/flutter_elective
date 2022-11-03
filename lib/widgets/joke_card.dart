import 'package:elective/models/joke.dart';
import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;
  const JokeCard(this.joke, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
      elevation: 12,
      color: Colors.white,
      child: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(joke.value ?? "No more jokes for today",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          )),
    ));
  }
}
