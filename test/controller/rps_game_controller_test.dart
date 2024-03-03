import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissors_game/constants.dart/strings.dart';
import 'package:rock_paper_scissors_game/controller/rps_game_controller.dart';

void main() {
  final gameController = RPSGameController();

  group('RPSController computer move tests', () {
    test('Generating random computer move', () {
      final computerMove = gameController.generateComputerMove();

      expect(computerMove, isNotNull);
      expect(Move.values.contains(computerMove), isTrue);
    });
    test('generateComputerMove produces all possible moves over multiple calls',
        () {
      final allMoves = <Move>{};

      for (int i = 0; i < 100; i++) {
        final computerMove = gameController.generateComputerMove();
        allMoves.add(computerMove);
      }

      expect(allMoves.length, equals(Move.values.length));
    });
  });
  group('RPSController player move tests', () {
    test('generatePlayerMove returns Move.rock for input rock', () {
      expect(gameController.generatePlayerMove('rock'), equals(Move.rock));
    });
    test('generatePlayerMove returns Move.paper for input paper', () {
      expect(gameController.generatePlayerMove('paper'), equals(Move.paper));
    });

    test('generatePlayerMove returns Move.scissors for input scissors', () {
      expect(
          gameController.generatePlayerMove('scissors'), equals(Move.scissors));
    });

    test('generatePlayerMove throws an exception for invalid input', () {
      expect(
          () => gameController.generatePlayerMove('invalid'), throwsException);
    });
    group('Tests to determine the winner', () {
      test(
          'determineWinner returns Strings.tie when playerMove equals computerMove',
          () {
        expect(gameController.determineWinner(Move.rock, Move.rock),
            equals(Strings.tie));
      });

      test(
          'determineWinner returns Strings.playerWins for winning playerMove scenarios',
          () {
        expect(gameController.determineWinner(Move.paper, Move.rock),
            equals(Strings.playerWins));
        expect(gameController.determineWinner(Move.rock, Move.scissors),
            equals(Strings.playerWins));
        expect(gameController.determineWinner(Move.scissors, Move.paper),
            equals(Strings.playerWins));
      });

      test(
          'determineWinner returns Strings.computerWins for winning computerMove scenarios',
          () {
        expect(gameController.determineWinner(Move.rock, Move.paper),
            equals(Strings.computerWins));
        expect(gameController.determineWinner(Move.scissors, Move.rock),
            equals(Strings.computerWins));
        expect(gameController.determineWinner(Move.paper, Move.scissors),
            equals(Strings.computerWins));
      });

      test('determineWinner throws an error for invalid inputs', () {
        expect(
            () => gameController.determineWinner(
                Move.rock, (Move.values.length + 1) as Move),
            throwsA(isA<TypeError>()));
      });
    });
  });
}
