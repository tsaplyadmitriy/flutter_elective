import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elective/network/joke_network.dart';

class JokeRepository {
  final dio = Dio();
  final int pagination = 20;

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

    return jokeList;
  }
}
