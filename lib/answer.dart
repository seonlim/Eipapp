import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final VoidCallback answerTap;
  final String answerText;
  Color? answerColor;

  Answer({required this.answerText, required this.answerTap, required this.answerColor,});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.answerTap,
      style: TextButton.styleFrom(backgroundColor: widget.answerColor),
      child: Text(
        widget.answerText,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}

//