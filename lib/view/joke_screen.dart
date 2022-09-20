import 'dart:developer';

import 'package:elective/bloc/joke_bloc.dart';

import 'package:elective/widgets/swipe_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favourite_screen.dart';

class JokeScreen extends StatelessWidget {
  JokeBloc? bloc;
  JokeScreen() {
    bloc = JokeBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                margin: EdgeInsets.only(right: 24),
                child: InkWell(
                  child: Icon(Icons.star),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            FavouriteScreen(bloc ?? JokeBloc()),
                      ),
                    );
                  },
                ))
          ],
        ),
        body: BlocProvider(
            create: (_) => bloc ?? JokeBloc(),
            child: BlocBuilder<JokeBloc, JokeState>(builder: (context, state) {
              if (state is JokeInitialState || state is JokeLoadingState) {
                return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 150, horizontal: 32),
                    child: Container(
                        child: Center(child: CircularProgressIndicator())));
              }

              if (state is JokeNextState) {
                return JokeCardsWidget(
                    state.jokeList ?? [], context.read<JokeBloc>());
              }

              return Container();
            })));
  }
}
