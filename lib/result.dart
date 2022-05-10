
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;
  List selectedAnswer = [];
  Stopwatch? stopwatch;
  final dynamic formatTime;


  Result(this.totalScore, this.resetQuiz, this.selectedAnswer, this.stopwatch, this.formatTime);

  String get resultPhrase {
    String resultText;
    if (totalScore >=60) {
      resultText = '합격!';
      print(totalScore);
    } else {
      resultText = '과락!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '결과',
        ),
        leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
             Text(
               '총 소요 시간: ' + formatTime(stopwatch?.elapsedMilliseconds),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
             ),
            Text(
              '총점: '+'$totalScore/100',
              style: TextStyle(fontSize: 50),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  //selectedAnswer answerText index가 들어와야함
                ],
              ),
            ),
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {// 클릭하면 문제풀이 선택 페이지로
                Navigator.pushNamed(context, '/main');
                },
              child: Text('다시 풀러가기'))
          ],
        ),
      ),
    );
  }
}


