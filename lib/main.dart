import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_o_game/home/view/home_page.dart';
import 'package:x_o_game/home/view/play_page.dart';
import 'package:x_o_game/home/view_model/cubit/game_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GameCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "a": (context) => const HomePageScreen(),
      "b": (context) => HomePageMainScreen()
    }, home: HomePageMainScreen());
  }
}
