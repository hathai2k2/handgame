import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(
      {super.key,
      required this.score,
      required this.color,
      required this.textColor,
      required this.label});
  final int score;
  final Color color;
  final Color textColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Text(
        '$label \n$score ',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, letterSpacing: 4, color: textColor),
      ),
    );
  }
}
