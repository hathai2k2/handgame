import 'package:flutter/material.dart';
import 'package:handgame/r.dart';
import 'package:handgame/screens/handgame/component/header_score.dart';




class GameUI extends StatelessWidget {
  final int playerScore;
  final int botScore;
  final String playerChoice;
  final String botChoice;
  final VoidCallback onRockPressed;
  final VoidCallback onPaperPressed;
  final VoidCallback onScissorsPressed;
  final VoidCallback onPlayAgainPressed;
  final VoidCallback onRestartPressed;

  const GameUI({
    super.key,
    required this.playerScore,
    required this.botScore,
    required this.playerChoice,
    required this.botChoice,
    required this.onRockPressed,
    required this.onPaperPressed,
    required this.onScissorsPressed,
    required this.onPlayAgainPressed,
    required this.onRestartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock, Paper, Scissors Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreWidget(
                score: playerScore,
                color: Colors.amber,
                textColor: Colors.white,
                label: 'Player Score',
              ),
              const SizedBox(width: 20),
              ScoreWidget(
                score: botScore,
                color: Colors.redAccent,
                textColor: Colors.white,
                label: 'BOT Score',
              ),
            ],
          ),
          const SizedBox(height: 20),
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
                    ? handPlayerChoice(context, playerChoice)
                    : Container(),
                botChoice != '' ? handBotChoice( context, botChoice) : Container(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onRockPressed,
                child: const Text('Rock'),
              ),
              ElevatedButton(
                onPressed: onPaperPressed,
                child: const Text('Paper'),
              ),
              ElevatedButton(
                onPressed: onScissorsPressed,
                child: const Text('Scissors'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPlayAgainPressed,
                child: const Text('Play again'),
              ),
              ElevatedButton(
                onPressed: onRestartPressed,
                child: const Text('restart'),
              ),
            ],
          )
        ],
      ),
    );
  }

  handBotChoice(BuildContext context, String playChoice) {
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
      default:
        return Container();
    }
  }

  handPlayerChoice(BuildContext context, String playChoice) {
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
      default:
        return Container();
    }
  }
}
