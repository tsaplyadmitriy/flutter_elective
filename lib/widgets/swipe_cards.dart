import 'dart:developer';

import 'package:elective/bloc/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';

import '../network/joke_network.dart';

class JokeCardsWidget extends StatelessWidget {
  List<Joke> jokeList;
  JokeBloc bloc;

  JokeCardsWidget(this.jokeList, this.bloc);

  @override
  Widget build(BuildContext context) {
    var items = jokeList
        .map((joke) => SwipeItem(
            content: joke,
            likeAction: () {
              bloc.add(JokeNextEvent(joke, Swipe.RIGHT));
            },
            nopeAction: () {
              bloc.add(JokeNextEvent(joke, Swipe.LEFT));
            }))
        .toList();

    var _matchEngine = MatchEngine(swipeItems: items);

    return items.isNotEmpty
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 128),
            child: SwipeCards(
                matchEngine: _matchEngine,
                onStackFinished: () {
                  bloc.add(LoadJokesEvent());
                },
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(32),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 450,
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(items[index].content.value ?? "No text",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    letterSpacing: -1)),
                          ],
                        ))),
                  );
                }))
        : const Center(
            child: Text('No films to Swipe right now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          );
  }
}
