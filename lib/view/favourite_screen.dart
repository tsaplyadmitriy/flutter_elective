import 'package:elective/bloc/joke_bloc.dart';
import 'package:flutter/material.dart';

import '../network/joke_network.dart';
import '../widgets/joke_card.dart';

class FavouriteScreen extends StatelessWidget {
  JokeBloc bloc;
  FavouriteScreen(this.bloc);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidgets = bloc.favList.map(
      (joke) {
        return JokeCard(joke);
      },
    ).toList();

    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: ListView(
                padding: const EdgeInsets.all(8), children: listWidgets)));
  }
}
