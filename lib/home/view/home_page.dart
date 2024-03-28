import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_o_game/home/view_model/cubit/game_cubit.dart';

class HomePageMainScreen extends StatelessWidget {
  HomePageMainScreen({super.key});
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: textEditingController1,
                    decoration: InputDecoration(
                        labelText: "First Player",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: textEditingController2,
                    decoration: InputDecoration(
                        labelText: "Second Player",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (textEditingController1.text != "" &&
                          textEditingController2.text != "") {
                        BlocProvider.of<GameCubit>(context).plyaronename =
                            textEditingController1.text;
                        BlocProvider.of<GameCubit>(context).plyartwoname =
                            textEditingController2.text;
                        Navigator.of(context).pushNamed("a");
                      }
                    },
                    child: const Text("أنتقل الى شاشة اللعب "))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
