import 'package:flutter/material.dart';

class MockSettingScreen extends StatefulWidget {
  @override
  _MockSettingScreenState createState() => _MockSettingScreenState();
}

enum Mode { PRT, ACT }
final _rangeList = ['2020년 1회차', '2020년 2회차', '2021년 1회차', '2021년 2회차', '2022년 1회차'];
enum Index { BASIC, CHOOSE }
late final VoidCallback startTimer;


class _MockSettingScreenState extends State<MockSettingScreen> {
  bool isChecked = false;
  Mode? _mode = Mode.ACT; //초기사항은 PRT로 설정.
  var _selectedRange = '2020년 1회차';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('모의고사 풀이 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                Text('1. 모드 선택',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                RadioListTile<Mode>(
                  title: Text('한 문제씩 풀기(연습모드, 카운트업)'),
                    value: Mode.PRT,
                    groupValue: _mode,
                    onChanged: (Mode? value) {
                      setState(() {
                       _mode = value;
                      });
                    },
                ),
              RadioListTile(
                title: Text('실전처럼 풀기(실전모드, 카운트다운: 150분 )'),
                  value: Mode.ACT,
                  groupValue: _mode,
                  onChanged: (Mode? value) {
                    setState(() {
                      _mode = value;
                    });
                  },
              ),
                  Text('2. 문제 순서',
                    style: TextStyle(
                      fontSize: 25.0,
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
              Text('3. 회차 선택',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 250,
                      child: DropdownButton(
                        isExpanded: true,
                        value: _selectedRange,
                        items: _rangeList.map(
                                (value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 20,),
                                ),
                              );
                            }
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRange = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 10,),
                Center(
                  child: ElevatedButton(
                    // 클릭하면 시험 시작. 여기서 두가지 모드 스크린 선택하고 문제 순서 랜덤 , 선택된 회차 세가지 넘겨주기
                    onPressed: () {
                      Navigator.pushNamed(context, '/play');
                      },
                    child: Text("풀이 시작하기",),
                  ),
                ),
              SizedBox(height: 10,),
              ],
        ),
      ),
    );
  }
}

