import 'dart:developer';
import 'package:elective/bloc/joke_bloc.dart';
import 'package:elective/models/joke.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:url_launcher/url_launcher.dart';

class JokeCardsWidget extends StatelessWidget {
  final List<Joke> jokeList;
  final JokeBloc bloc;

  const JokeCardsWidget(this.jokeList, this.bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    var items = jokeList
        .map((joke) => SwipeItem(
            content: joke,
            likeAction: () {
              bloc.add(JokeNextEvent(joke, Swipe.right));
            },
            nopeAction: () {
              bloc.add(JokeNextEvent(joke, Swipe.left));
            }))
        .toList();

    var matchEngine = MatchEngine(swipeItems: items);

    return items.isNotEmpty
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 128),
            child: SwipeCards(
                matchEngine: matchEngine,
                onStackFinished: () {
                  bloc.add(LoadJokesEvent());
                },
                itemBuilder: (context, index) {
                  return Column(children: [
                    Card(
                      margin: const EdgeInsets.all(32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                          height: 300,
                          padding: const EdgeInsets.all(24),
                          width: double.infinity,
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              Text(items[index].content.value ?? "No text",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      letterSpacing: -1)),
                            ],
                          ))),
                    ),
                    InkWell(
                        onTap: () async {
                          log(items[index].content.url);
                          String url = items[index].content.url;
                          log(url.toString());

                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        child: const Text("Click to see more",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                letterSpacing: -1)))
                  ]);
                }))
        : const Center(
            child: Text('No jokes to Swipe right now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          );
  }
}
