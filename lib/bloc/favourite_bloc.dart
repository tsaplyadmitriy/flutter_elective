import 'package:elective/models/joke.dart';
import 'package:elective/repository/storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FavEvent {}

abstract class FavState {}

class LoadJokeFavEvent extends FavEvent {}

class LoadingFavState extends FavState {}

class LoadedFavState extends FavState {
  List<Joke> jokes;
  LoadedFavState(this.jokes);
}

class NoJokesFavState extends FavState {}

class FavBloc extends Bloc<FavEvent, FavState> {
  StorageRepository? storageRepository;
  FavBloc() : super(LoadingFavState()) {
    storageRepository = StorageRepository();

    on<LoadJokeFavEvent>(_loadJokes);
  }

  Future<void> _loadJokes(FavEvent event, Emitter<FavState> emit) async {
    List<Joke> jokes =
        await storageRepository?.getFavouriteJokes() ?? [Joke.testJoke()];
    bool isAnyFavJoke = await storageRepository?.isEmptyJokes() ?? false;

    if (!isAnyFavJoke) {
      return emit(LoadedFavState(jokes));
    } else {
      return emit(NoJokesFavState());
    }
  }
}
