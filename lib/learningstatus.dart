import 'package:flutter/material.dart';

class LearningStatus extends StatelessWidget {
  const LearningStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("정보 처리 기사",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/solutionrecord'); },
              child: Text(
                "시험 별 풀이기록",
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {// 클릭하면 학습 현황 페이지로
                Navigator.pushNamed(context, '/practicemode'); },
              child: Text(
                "즐겨찾기 문제",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
