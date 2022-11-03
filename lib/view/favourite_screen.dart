import 'package:elective/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/joke_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
            create: (_) => FavBloc()..add(LoadJokeFavEvent()),
            child: BlocBuilder<FavBloc, FavState>(builder: (context, state) {
              if (state is LoadingFavState) {
                return const CircularProgressIndicator();
              }
              if (state is LoadedFavState) {
                List<Widget> listWidgets = state.jokes
                    .map(
                      (joke) {
                        return JokeCard(joke);
                      },
                    )
                    .toList()
                    .reversed
                    .toList();
                return ListView(
                    padding: const EdgeInsets.all(8), children: listWidgets);
              }
              return const CircularProgressIndicator();
            })));
  }
}
