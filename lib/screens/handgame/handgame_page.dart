import 'package:flutter/material.dart';
import 'package:handgame/r.dart';
import 'dart:math';

import 'package:handgame/screens/handgame/component/header_score.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock, Paper, Scissors Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreWidget(
                score: playerScore,
                color: Colors.amber,
                textColor: Colors.white,
                label: 'Player Score',
              ),
              const SizedBox(
                width: 20,
              ),
              ScoreWidget(
                score: botScore,
                color: Colors.redAccent,
                textColor: Colors.white,
                label: 'BOT Score',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Player \n$playerChoice ',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, letterSpacing: 2),
              ),
              Text(
                'BOT \n$botChoice',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, letterSpacing: 2),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerChoice != ''
                    ? handPlayerChoice(playerChoice)
                    : Container(),
                botChoice != '' ? handBotChoice(botChoice) : Container(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerChoice = 'Rock';
                    botChoice = getBotChoice();
                    calculateResult();
                  });
                },
                child: const Text('Rock'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerChoice = 'Paper';
                    botChoice = getBotChoice();
                    calculateResult();
                  });
                },
                child: const Text('Paper'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerChoice = 'Scissors';
                    botChoice = getBotChoice();
                    calculateResult();
                  });
                },
                child: const Text('Scissors'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerChoice = '';
                    botChoice = '';
                  });
                },
                child: const Text('Play again'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerScore = 0;
                    botScore = 0;
                    playerChoice = '';
                    botChoice = '';
                  });
                },
                child: const Text('restart'),
              ),
            ],
          )
        ],
      ),
    );
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

  handBotChoice(String playChoice) {
    switch (playChoice) {
      case 'Rock':
        return Image.asset(
          UIdata.icBotRock,
          width: MediaQuery.of(context).size.width * 0.4,
        );
      case 'Paper':
        return Image.asset(
          UIdata.icBotPaper,
          width: MediaQuery.of(context).size.width * 0.4,
        );
      case 'Scissors':
        return Image.asset(
          UIdata.icBotScissors,
          width: MediaQuery.of(context).size.width * 0.4,
        );
    }
  }

  handPlayerChoice(String playChoice) {
    switch (playChoice) {
      case 'Rock':
        return Image.asset(
          UIdata.icPlayerRock,
          width: MediaQuery.of(context).size.width * 0.4,
        );
      case 'Paper':
        return Image.asset(
          UIdata.icPlayerPaper,
          width: MediaQuery.of(context).size.width * 0.4,
        );
      case 'Scissors':
        return Image.asset(
          UIdata.icPlayerScissors,
          width: MediaQuery.of(context).size.width * 0.4,
        );
    }
  }
}
