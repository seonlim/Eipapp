import 'package:flutter/material.dart';

class SolutionRecord extends StatefulWidget {
  const SolutionRecord({Key? key}) : super(key: key);

  @override
  State<SolutionRecord> createState() => _SolutionRecordState();
}

class _SolutionRecordState extends State<SolutionRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("시험 별 풀이기록",
        ),
        leading: Icon(Icons.menu),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/'); },
              child: Text(
                "패키지 사용 예정",
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
