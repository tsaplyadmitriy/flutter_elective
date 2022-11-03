import 'dart:developer';

import 'package:elective/bloc/joke_bloc.dart';
import 'package:elective/widgets/swipe_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favourite_screen.dart';

class JokeScreen extends StatelessWidget {
  final JokeBloc bloc = JokeBloc();
  JokeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 24),
              child: Row(children: [
                InkWell(
                  child: const Icon(Icons.star),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ),
                    );
                  },
                ),
              ]),
            )
          ],
        ),
        body: SafeArea(
            child: BlocProvider(
                create: (_) => bloc,
                child:
                    BlocBuilder<JokeBloc, JokeState>(builder: (context, state) {
                  if (state is JokeInitialState || state is JokeLoadingState) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 150, horizontal: 32),
                        child:
                            const Center(child: CupertinoActivityIndicator()));
                  }

                  if (state is JokeNextState) {
                    log(state.hashCode.toString());
                    return JokeCardsWidget(
                        state.jokeList, context.read<JokeBloc>());
                  }

                  return Container();
                }))));
  }
}
