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
  List<bool> isSelected = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        children: [
          Text('1'),
          Text('2'),
          Text(widget.answerText),
        ],
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected
    );
  }
}

//연습모드 좀 더 업그레이드, 에러 해결