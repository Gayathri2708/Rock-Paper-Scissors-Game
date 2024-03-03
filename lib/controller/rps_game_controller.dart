import 'dart:math';

import 'package:get/get.dart';
import 'package:rock_paper_scissors_game/constants.dart/strings.dart';

enum Move { rock, paper, scissors }

class RPSGameController extends GetxController {
  List<String> moves = [Strings.rock, Strings.paper, Strings.scissors];

  Move generateComputerMove() {
    Random random = Random();
    return Move.values[random.nextInt(Move.values.length)];
  }

  Move generatePlayerMove(String moves) {
    switch (moves) {
      case Strings.rock:
        return Move.rock;
      case Strings.paper:
        return Move.paper;
      case Strings.scissors:
        return Move.scissors;
      default:
        throw Exception();
    }
  }

  String determineWinner(Move playerMove, Move computerMove) {
    if (!Move.values.contains(playerMove) ||
        !Move.values.contains(computerMove)) {
      throw ArgumentError(
          'Invalid input: playerMove and computerMove must be valid Move enum values.');
    }
    if (playerMove == computerMove) {
      return Strings.tie;
    } else if ((playerMove == Move.paper && computerMove == Move.rock) ||
        (playerMove == Move.rock && computerMove == Move.scissors) ||
        (playerMove == Move.scissors && computerMove == Move.paper)) {
      return Strings.playerWins;
    } else {
      return Strings.computerWins;
    }
  }
}
