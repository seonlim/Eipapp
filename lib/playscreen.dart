import 'dart:async';
import 'package:final_eipapp/result.dart';
import 'package:flutter/material.dart';
import 'package:final_eipapp/answer.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PlayScreen extends StatefulWidget {

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  final questions = const [
    {
      'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
      'answers': [
        {'answerText': 'Hamburgers', 'score': false},
        {'answerText': 'Fried chicken', 'score': true},
        {'answerText': 'Pizza', 'score': false},
      ],
    },
    {
      'question':
      'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
      'answers': [
        {'answerText': 'His tongue', 'score': true},
        {'answerText': 'His leg', 'score': false},
        {'answerText': 'His butt', 'score': false},
      ],
    },
    {
      'question': 'In which country are Panama hats made?',
      'answers': [
        {'answerText': 'Ecuador', 'score': true},
        {'answerText': 'Panama (duh)', 'score': false},
        {'answerText': 'Portugal', 'score': false},
      ],
    },
  ];


  static const countdownDuration = Duration(hours: 1, minutes: 30);
  Duration duration = Duration();
  Timer? countdowntimer;
  bool countDown = true; //카운트 다운 타이머
  Stopwatch? stopwatch; //스탑워치
  Color _iconColor = Colors.grey;
  int _currentIndex = 0;
  int answerIndex = 0;
  int totalScore = 0;
  bool answerWasSelected = false;
  bool correctAnswerSelected = false;
  bool endOfQuiz = false;
  List<int> finalAnswer = [-1, -1, -1];
  List<bool> answerState = [false, false, false, false];

  String formatTime (int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  saveData () async {
    var storage = await SharedPreferences.getInstance();
    storage.setString('answer', jsonEncode({ 'answerText' : 20 }));
    var result = storage.getString('answer') ?? '없는데요';
    print(jsonDecode(result));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
    startTimer();
    stopwatch = Stopwatch();
    startStop();
  }

  void startTimer(){
    countdowntimer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void startStop() {
      stopwatch?.start();
  }

  void addTime () {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds <0){
        countdowntimer?.cancel();
        stopwatch?.stop();
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                title: Center(child: const Text('시간이 만료되었습니다!')),
                actions: <Widget>[
                    Center(
                      child: TextButton(onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new Result(totalScore,resetQuiz,finalAnswer,stopwatch,formatTime)),
                          );
                        });
                      },
                          child: const Text('결과확인')),
                    ),
                ]
            )
        );
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void reset() {
    if (countDown) {
      setState(() =>
      duration = countdownDuration);
    } else{
      setState(() =>
      duration = Duration());
    }
  }

  void dispose() {
    countdowntimer?.cancel();
    stopwatch?.stop();
    super.dispose();
  }

  void _questionAnswered(bool answerScore) {
    setState(() {
      if (answerWasSelected && answerScore ) { //만약 answer점수가 true라면?
        totalScore+=5;
        correctAnswerSelected = true;
      }
      if (answerScore && !answerWasSelected ) {
        totalScore-=5;

      }
      if (_currentIndex == questions.length - 1 ) {
        endOfQuiz = true;
      }
    });
  }

  void _beforeQuestion() { //이전 버튼 누르면
    setState(() {
      if (_currentIndex < 1 ) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '이전 문제가 없습니다'),
        ));
        return;
      }
      if (answerWasSelected && correctAnswerSelected) {
        totalScore -=5;
      }
      _currentIndex--;
      answerWasSelected = true;
      correctAnswerSelected = false;
      endOfQuiz= false;
    });
  }

  void _nextQuestion() { //다음 버튼 누르면
    setState(() {
      _currentIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_currentIndex >= questions.length) {
      resetQuiz();
    }
  }

  void resetQuiz() { //리셋 시킴
    setState(() {
      _currentIndex = 0;
      totalScore = 0;
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '실전모드',    //과목명으로 바꿀거. currentindex에 따라서
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: const Text('아직 풀지 않은 문제가 있습니다!'),
                  content: const Text('이대로 채점하시겠습니까?'),
                  actions: <Widget>[
                    TextButton(onPressed: () => Navigator.of(context).pop(),
                      child: const Text('계속풀기', style: TextStyle(color: Colors.red),),
                    ),
                    TextButton(onPressed: () {
                      setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new Result(totalScore,resetQuiz,finalAnswer,stopwatch,formatTime)),
                          );
                      });
                    },
                        child: const Text('채점하기'))
                  ]
              )
          );
        },
      ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                child: Text('제1과목: 소프트웨어 설계 ',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              ),
              buildTime(),
            Container(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                  leading: Text('Q${_currentIndex+1}',
                    style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  trailing: IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor,
                    onPressed: () {
                      setState(() {
                        if(_iconColor == Colors.grey){
                          _iconColor = Colors.amber;
                        }else{
                          _iconColor = Colors.grey;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
              Container(
                width: double.infinity,
                height: 200.0,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    questions[_currentIndex]['question'].toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ...(questions[_currentIndex]['answers'] as List<Map<String,dynamic>> )
                  .map((answer) => Answer(
                answerText: answer['answerText'],
                answerColor: answerWasSelected //구분자가 없음.
                    ? Colors.amberAccent
                    : Colors.blue,
                answerTap: () {
                setState(() { //활성,비활성 조작
                  answerWasSelected=!answerWasSelected;
                  //ui자체에서 로직이 분리
                  _questionAnswered(answer['score']);
                });
                },
                )
              ).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.keyboard_arrow_left),
                label: Text('이전'),
                onPressed: () {
                  _beforeQuestion();
                },
              ),
              TextButton(
                onPressed: () {},
                child: Text('${_currentIndex+1}/${questions.length}'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
              ),
              TextButton(
                child: Row(
                  children: [
                    Text(endOfQuiz ? '결과보기' : '다음',
                      style: TextStyle(
                        color: endOfQuiz ? Colors.red : Colors. black,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '답을 선택해야 넘어갈 수 있습니다!'),
                    ));
                    return;
                  }
                  if (endOfQuiz) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new Result(totalScore,resetQuiz,finalAnswer, stopwatch, formatTime), ),
                    );
                  }
                  else{_nextQuestion();}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours =twoDigits(duration.inHours);
    final minutes =twoDigits(duration.inMinutes.remainder(60));
    final seconds =twoDigits(duration.inSeconds.remainder(60));

    return
      Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Text(formatTime(stopwatch!.elapsedMilliseconds),),
              Icon(Icons.timer),
              SizedBox(width: 10.0,),
              Text('남은 시간: '+'$hours'+'h  '+'$minutes'+'m  '+'$seconds'+'s',
                style: TextStyle(fontSize: 12,),
              ),
            ],
          ),
          );
  }
}


// 버튼 해결방법
//1. answerText
//2. UUID? -> ㅈㅏ동생성
//타이머 카운트다운
//오답노트 -> 데이터베이스가 들어가야해서 나중에해야함