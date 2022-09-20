import 'dart:collection';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:elective/network/joke_network.dart';
import 'package:elective/repository/json_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum Swipe { LEFT, RIGHT }

abstract class JokeEvent {}

abstract class JokeState {
  List<Joke>? jokeList;
}

class JokeNextState extends JokeState {
  List<Joke>? jokeList;
  JokeNextState({this.jokeList});
}

class JokeInitialState extends JokeState {}

class JokeLoadingState extends JokeState {}

class JokeNextEvent extends JokeEvent {
  Swipe swipe;
  Joke swipedJoke;
  JokeNextEvent(this.swipedJoke, this.swipe);
}

class LoadJokesEvent extends JokeEvent {}

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  List<Joke> currentJokeList = [];
  List<Joke> favList = [];
  JokeRepository? jokeRepository;
  JokeBloc() : super(JokeInitialState()) {
    jokeRepository = JokeRepository();
    on<JokeNextEvent>(_nextJoke);
    on<LoadJokesEvent>(_loadJokes);

    add(LoadJokesEvent());
  }

  Future<void> _nextJoke(JokeNextEvent event, Emitter<JokeState> emit) async {
    log(event.swipe.toString());
    if (event.swipe == Swipe.RIGHT) {
      favList.add(event.swipedJoke);
    }
  }

  Future<void> _loadJokes(LoadJokesEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoadingState());

    List<Joke> jokeList = await jokeRepository!.getJokeList();
    currentJokeList.addAll(jokeList);

    return emit(JokeNextState(jokeList: currentJokeList));
  }
}
