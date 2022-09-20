import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elective/network/joke_network.dart';

class JokeRepository {
  final dio = Dio();
  final int pagination = 6;

  RestClient? jokeNetwork;

  JokeRepository() {
    jokeNetwork = RestClient(dio);
  }

  Future<List<Joke>> getJokeList() async {
    List<Future<Joke>> futureList = [];

    if (jokeNetwork != null) {
      for (int i = 0; i < pagination; i++) {
        futureList.add(jokeNetwork!.getNextJoke());
      }
    }

    List<Joke> jokeList = await Future.wait(futureList);
    // List<Joke> jokeList = [
    //   Joke(value: "1", id: "1"),
    //   Joke(value: "2", id: "2"),
    //   Joke(value: "3", id: "3"),
    //   Joke(value: "4", id: "4"),
    //   Joke(value: "5", id: "5")
    // ];
    return jokeList;
  }
}
