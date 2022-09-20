import 'package:flutter/material.dart';

import '../network/joke_network.dart';

class JokeCard extends StatelessWidget {
  Joke joke;
  JokeCard(this.joke);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      elevation: 4,
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.all(32),
          child: Center(child: Text(joke.value ?? "No more jokes for today"))),
    ));
  }
}
