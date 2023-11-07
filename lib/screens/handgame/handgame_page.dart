import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handgame/screens/handgame/component/game_ui.dart';
import 'package:handgame/screens/handgame/component/showdialog.dart';

class RockPaperScissorsGame extends StatefulWidget {
  const RockPaperScissorsGame({super.key});

  @override
  State<RockPaperScissorsGame> createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  int playerScore = 0;
  int botScore = 0;
  String playerChoice = '';
  String botChoice = '';

  @override
  Widget build(BuildContext context) {
    return GameUI(
      playerScore: playerScore,
      botScore: botScore,
      playerChoice: playerChoice,
      botChoice: botChoice,
      onRockPressed: () => _onChoiceSelected('Rock'),
      onPaperPressed: () => _onChoiceSelected('Paper'),
      onScissorsPressed: () => _onChoiceSelected('Scissors'),
      onPlayAgainPressed: _resetChoices,
      onRestartPressed: _resetGame,
    );
  }

  void _onChoiceSelected(String choice) {
    setState(() {
      playerChoice = choice;
      botChoice = getBotChoice();
      calculateResult();
    });
  }

  void _resetChoices() {
    setState(() {
      playerChoice = '';
      botChoice = '';
    });
  }

  void _resetGame() {
    setState(() {
      playerScore = 0;
      botScore = 0;
      playerChoice = '';
      botChoice = '';
    });
  }

  String getBotChoice() {
    final choices = ['Rock', 'Paper', 'Scissors'];
    final random = Random();
    return choices[random.nextInt(3)];
  }

  void calculateResult() {
    if (playerChoice == botChoice) {
      showDialog(
        context: context,
        builder: (context) => const CustomDialog(
          message: 'DRAW BRO !!',
        ),
      );
    } else if ((playerChoice == 'Rock' && botChoice == 'Scissors') ||
        (playerChoice == 'Paper' && botChoice == 'Rock') ||
        (playerChoice == 'Scissors' && botChoice == 'Paper')) {
      showDialog(
        context: context,
        builder: (context) => const CustomDialog(
          message: 'YOU WIN !!',
        ),
      );
      playerScore++;
    } else {
      showDialog(
        context: context,
        builder: (context) => const CustomDialog(
          message: 'YOU LOSS !!',
        ),
      );
      botScore++;
    }
  }
}
