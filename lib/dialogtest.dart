import 'package:flutter/material.dart';

class DialogTest extends StatefulWidget {
  const DialogTest({Key? key}) : super(key: key);

  @override
  _DialogTestState createState() => _DialogTestState();
}

class _DialogTestState extends State<DialogTest> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 100,
        color: Colors.red,
        child: Center(
          child: Column(
            children: [
              ListTile(
                title: Container(
                  child: Column(children: [
                    Text('완료: ${isCompleted == true ? 'True' : 'False'}',
                    ),
                  ]),
                ),
                onTap: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog'),
                        content: const Text('완료 상태를 바꾸실?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                              child: const Text('No'),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isCompleted == true
                                      ? isCompleted = false
                                      : isCompleted = true;
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text('Yes'),
                          ),
                        ],
                      ),
                      );
                },
              )
            ],
          )
        )
      ),
    );
  }
}
