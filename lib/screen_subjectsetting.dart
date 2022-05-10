import 'package:flutter/material.dart';

class SubjectSettingScreen extends StatefulWidget {
  @override
  _SubjectSettingScreenState createState() => _SubjectSettingScreenState();
}

enum Mode { PRT, ACT }
final _startRange = ['2020년 1회차', '2020년 2회차', '2021년 1회차', '2021년 2회차', '2022년 1회차'];
final _endRange = ['2020년 1회차', '2020년 2회차', '2021년 1회차', '2021년 2회차', '2022년 1회차'];
enum Index { BASIC, CHOOSE }
final List subjectList = [
  {'name': "1과목: 소프트웨어 설계", "isSubjected": true},
  {"name": "2과목: 소프트웨어 개발", "isSubjected": false},
  {"name": "3과목: 데이터베이스 구축", "isSubjected": false},
  {"name": "4과목: 프로그래밍 언어 활용 ", "isSubjected": false},
  {"name": "5과목: 정보시스템 구축관리", "isSubjected": false},
];

class _SubjectSettingScreenState extends State<SubjectSettingScreen> {
  bool isChecked = false;
  var _startSelected = '2020년 1회차';
  var _endSelected = '2022년 1회차';
  bool isSubjected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('과목별 풀이 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('1. 문제 순서',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            ListTile(
              title: Text('문제 순서 랜덤'),
              leading: Switch(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    if(value != null)
                      isChecked = value;
                  }
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('2. 범위 선택',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
             Row(
                children: [
                  Container(
                    width: 150,
                    child: DropdownButton(
                      isExpanded: true,
                      value: _startSelected,
                      items: _startRange.map(
                              (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 18,),
                              ),
                            );
                          }
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _startSelected = value.toString();
                        });
                      },
                    ),
                  ),
                  Text(' ~ ',style: TextStyle(fontSize: 30.0),),
                  Container(
                    width: 150,
                    child: DropdownButton(
                      isExpanded: true,
                      value: _endSelected,
                      items: _endRange.map(
                              (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 18,),
                              ),
                            );
                          }
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _endSelected = value.toString();
                        });
                      },
                    ),
                  ),
                ]
              ),

            SizedBox(
              height: 10,
            ),
            Text('3. 과목 선택',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Column(
              children: subjectList.map ((subject){
                return CheckboxListTile(
                    title: Text(subject["name"]),
                    value: subject["isSubjected"],
                    onChanged: (newValue) {
                      setState(() {
                        subject["isSubjected"]=newValue;
                      });
                    });
              }).toList(),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {// 클릭하면 play 페이지로
                  Navigator.pushNamed(context, '/play'); },
                child: Text("풀이 시작",),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

