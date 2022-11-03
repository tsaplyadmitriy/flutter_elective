import 'dart:developer';
import 'package:elective/models/joke.dart';
import 'package:elective/repository/joke_repository.dart';
import 'package:elective/repository/storage_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum Swipe { left, right }

abstract class JokeEvent {}

abstract class JokeState {}

class JokeNextState extends JokeState {
  List<Joke> jokeList;
  JokeNextState(this.jokeList);
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
  StorageRepository? storageRepository;
  JokeBloc() : super(JokeInitialState()) {
    jokeRepository = JokeRepository();
    storageRepository = StorageRepository();
    on<JokeNextEvent>(_nextJoke);
    on<LoadJokesEvent>(_loadJokes);

    add(LoadJokesEvent());
  }

  Future<void> _nextJoke(JokeNextEvent event, Emitter<JokeState> emit) async {
    log(event.swipe.toString());
    if (event.swipe == Swipe.right) {
      await storageRepository?.storeNewJoke(event.swipedJoke);
    }
  }

  Future<void> _loadJokes(LoadJokesEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoadingState());

    List<Joke> jokeList = await jokeRepository!.getJokeList();
    currentJokeList.addAll(jokeList);

    JokeNextState nextState = JokeNextState(currentJokeList);

    return emit(nextState);
  }
}
