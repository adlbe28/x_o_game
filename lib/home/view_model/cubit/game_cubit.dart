import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_o_game/home/view_model/cubit/game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());
  int count = 2;
  String winName = "";
  String namewin = "";
  int pointPlayerOne = 0;
  int pointPlayerTwo = 0;
  String plyaronename = "";
  String plyartwoname = "";

  List<String> charList = List.generate(9, (index) => "");
  List<Color> colorList = List.generate(
    9,
    (index) => Colors.grey.withOpacity(0.7),
  );
  void tap(int indux) {
    if (count % 2 == 0 && charList[indux] == "") {
      charList[indux] = "X";
      winName = "X";
      count++;
    } else if (count % 2 != 0 && charList[indux] == "") {
      charList[indux] = "O";
      winName = "O";
      count++;
    }
    emit(GameInitial());
    ifstate(winName);
  }

  void tapplayagin() {
    count = 2;
    emit(GameInitial());
  }

  void removpoint() {
    pointPlayerOne = 0;
    pointPlayerTwo = 0;
    plyaronename = "";
    plyartwoname = "";
  }

  void ifstate(String winName) async {
    if ((charList[0] == charList[1] &&
            charList[0] == charList[2] &&
            charList[0] != "") ||
        (charList[0] == charList[3] &&
            charList[0] == charList[6] &&
            charList[0] != "") ||
        (charList[0] == charList[4] &&
            charList[0] == charList[8] &&
            charList[0] != "") ||
        (charList[4] == charList[1] &&
            charList[1] == charList[7] &&
            charList[1] != "") ||
        (charList[5] == charList[2] &&
            charList[2] == charList[8] &&
            charList[2] != "") ||
        (charList[4] == charList[2] &&
            charList[2] == charList[6] &&
            charList[2] != "") ||
        (charList[4] == charList[3] &&
            charList[3] == charList[5] &&
            charList[3] != "") ||
        (charList[7] == charList[6] &&
            charList[8] == charList[6] &&
            charList[6] != "")) {
      ifcolor();
      await Future.delayed(const Duration(milliseconds: 400));
      colorList = List.generate(9, (index) => Colors.grey.withOpacity(0.7));
      charList = List.generate(9, (index) => "");
      if (winName == "X") {
        winName = plyaronename;
        pointPlayerOne++;
      } else if (winName == "O") {
        winName = plyartwoname;
        pointPlayerTwo++;
      }
      if (winName == plyartwoname) {
        namewin = plyartwoname;
      }
      if (winName == plyaronename) {
        namewin = plyaronename;
      }

      emit(GameWin(charactWin: winName));
    } else {
      if (charList[0] != "" &&
          charList[1] != "" &&
          charList[2] != "" &&
          charList[3] != "" &&
          charList[4] != "" &&
          charList[5] != "" &&
          charList[6] != "" &&
          charList[7] != "" &&
          charList[8] != "") {
        emit(GameDraw());
        charList = ["", "", "", "", "", "", "", "", ""];
      }
    }
  }

  void ifcolor() {
    if ((charList[0] == charList[1] &&
        charList[0] == charList[2] &&
        charList[0] != "")) {
      colorList[0] = Colors.green;
      colorList[1] = Colors.green;
      colorList[2] = Colors.green;
    }
    if ((charList[0] == charList[3] &&
        charList[0] == charList[6] &&
        charList[0] != "")) {
      colorList[0] = Colors.green;
      colorList[3] = Colors.green;
      colorList[6] = Colors.green;
    }
    if ((charList[0] == charList[4] &&
        charList[0] == charList[8] &&
        charList[0] != "")) {
      colorList[0] = Colors.green;
      colorList[4] = Colors.green;
      colorList[8] = Colors.green;
    }
    if ((charList[4] == charList[1] &&
        charList[4] == charList[7] &&
        charList[4] != "")) {
      colorList[4] = Colors.green;
      colorList[1] = Colors.green;
      colorList[7] = Colors.green;
    }
    if ((charList[2] == charList[5] &&
        charList[2] == charList[8] &&
        charList[2] != "")) {
      colorList[8] = Colors.green;
      colorList[5] = Colors.green;
      colorList[2] = Colors.green;
    }
    if ((charList[2] == charList[4] &&
        charList[2] == charList[6] &&
        charList[2] != "")) {
      colorList[4] = Colors.green;
      colorList[6] = Colors.green;
      colorList[2] = Colors.green;
    }
    if ((charList[3] == charList[4] &&
        charList[3] == charList[5] &&
        charList[3] != "")) {
      colorList[3] = Colors.green;
      colorList[4] = Colors.green;
      colorList[5] = Colors.green;
    }
    if ((charList[6] == charList[8] &&
        charList[6] == charList[7] &&
        charList[6] != "")) {
      colorList[6] = Colors.green;
      colorList[7] = Colors.green;
      colorList[8] = Colors.green;
    }
  }
}
