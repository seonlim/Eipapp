import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:final_eipapp/mainsetting.dart';
import 'package:final_eipapp/solutionrecord.dart';
import 'package:final_eipapp/screen_mocksetting.dart';
import 'package:final_eipapp/screen_subjectsetting.dart';
import 'package:final_eipapp/playscreen.dart';
import 'package:final_eipapp/dialogtest.dart';
import 'package:final_eipapp/learningstatus.dart';

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "열려라참깨",
      home: MainPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          toolbarHeight: 70,
          titleTextStyle: TextStyle(color: Colors.white,
              fontSize: 23, fontWeight: FontWeight.bold),
          color: Color(0xff00539C),
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffFFd047),
            onPrimary: Colors.white,
            minimumSize: Size(280.0, 70.0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5.0,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50.0),
            alignment: Alignment.centerLeft,
            primary: Colors.black,
            textStyle: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.black,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      routes: {
        '/main': (context) => MainPage(),
        '/mainsetting' : (context) => MainSetting(),
        '/mocksetting': (context) => MockSettingScreen(),
        '/subjectsetting' : (context) => SubjectSettingScreen(),
        '/play' : (context) => PlayScreen(),
        '/learningstatus' : (context) => LearningStatus(),
        '/solutionrecord' : (context) => SolutionRecord(),
        '/dialogtest' : (context) => DialogTest(),
      },
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("정보 처리 기사"),
      ),
      body: MainButton(),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.settings, color: Colors.white,),
      onPressed: () {
      Navigator.pushNamed(context, '/mainsetting');
    }
    ),
    );
  }
}

//body 클래스 따로
class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 150, 20, 0),
      child: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mocksetting'); },
              child: Text(
                "모의고사 100제",
              ),
            ),
            ElevatedButton(
              onPressed: () {// 클릭하면 학습 현황 페이지로
                Navigator.pushNamed(context, '/subjectsetting'); },
              child: Text(
                "과목별 풀이",
              ),
            ),
            ElevatedButton(
              onPressed: () {// 클릭하면 학습 현황 페이지로
                Navigator.pushNamed(context, '/learningstatus'); },
              child: Text(
                "학습현황",
              ),
            ),
            ElevatedButton(
              onPressed: () {// 클릭하면 풀이 설정 페이지로
                Navigator.pushNamed(context, '/mappingtest'); },
              child: Text(
                "시험 일정",
              ),
            ),
          ],
        ),
      ),

    );
  }
}
