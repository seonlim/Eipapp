import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final int questionIndex;
  final String questionText;
  Question(this.questionText, this.questionIndex);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: Column(
        children: [
            ListTile(
              leading: Container(
                child: Text('Q${widget.questionIndex+1}',
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
              ),
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
          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Text(
              widget.questionText,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}