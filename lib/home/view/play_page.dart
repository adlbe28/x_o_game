import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_o_game/home/view_model/cubit/game_cubit.dart';
import 'package:x_o_game/home/view_model/cubit/game_state.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is GameInitial) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "X",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          BlocProvider.of<GameCubit>(context).plyaronename,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${BlocProvider.of<GameCubit>(context).pointPlayerOne}",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "O",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          BlocProvider.of<GameCubit>(context).plyartwoname,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${BlocProvider.of<GameCubit>(context).pointPlayerTwo}",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio:
                            MediaQuery.of(context).size.height * .001),
                    itemCount: 9,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<GameCubit>(context).tap(index);
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: BlocProvider.of<GameCubit>(context)
                                  .colorList[index],
                              borderRadius: BorderRadius.circular(20)),
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                              BlocProvider.of<GameCubit>(context)
                                  .charList[index],
                              style: const TextStyle(fontSize: 30)),
                        ),
                      );
                    },
                  ),
                )
              ]),
            );
          } else if (state is GameWin) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${BlocProvider.of<GameCubit>(context).namewin} Win",
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("b");
                        BlocProvider.of<GameCubit>(context).tapplayagin();
                        BlocProvider.of<GameCubit>(context).removpoint();
                      },
                      child: const Text("go to home")),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<GameCubit>(context).tapplayagin();
                      },
                      child: const Text("play agin"))
                ],
              ),
            );
          } else if (state is GameDraw) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Draw",
                    style: TextStyle(fontSize: 30),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("b");
                        BlocProvider.of<GameCubit>(context).tapplayagin();
                        BlocProvider.of<GameCubit>(context).removpoint();
                      },
                      child: const Text("go to home")),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<GameCubit>(context).tapplayagin();
                      },
                      child: const Text("play agin"))
                ],
              ),
            );
          } else {
            return const Center();
          }
        },
      )),
    );
  }
}
