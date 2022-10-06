import 'package:elective/bloc/joke_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/joke_card.dart';

class FavouriteScreen extends StatelessWidget {
  final JokeBloc bloc;
  const FavouriteScreen(this.bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidgets = bloc.favList.map(
      (joke) {
        return JokeCard(joke);
      },
    ).toList();

    return Scaffold(
        appBar: AppBar(),
        body:
            ListView(padding: const EdgeInsets.all(8), children: listWidgets));
  }
}
