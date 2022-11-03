import 'package:elective/models/joke.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageRepository {
  Future<void> storeNewJoke(Joke newJoke) async {
    await Hive.box<Joke>('jokeBox').add(newJoke);
  }

  Future<List<Joke>> getFavouriteJokes() async {
    return Hive.box<Joke>('jokeBox').values.toList();
  }

  Future<bool> isEmptyJokes() async {
    return Hive.box<Joke>('jokeBox').values.toList().isEmpty;
  }

  StorageRepository();
}
