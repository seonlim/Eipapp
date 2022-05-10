import 'package:flutter/material.dart';

class MainSetting extends StatefulWidget {
  const MainSetting({Key? key}) : super(key: key);

  @override
  State<MainSetting> createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  bool oneChecked = false;
  bool twoChecked = false;
  bool threeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Text('앱 버전'),
            trailing: Text('VER 1.2.3'),
          ),
          ListTile(
            leading: Text('배경음 설정'),
            trailing: Switch(
              value: oneChecked,
              onChanged: (value) {
                setState(() {
                  if(value != null)
                    oneChecked = value;
                }
                );
              },
          ),
          ),
          ListTile(
            leading: Text('버튼음 설정'),
            trailing: Switch(
              value: twoChecked,
              onChanged: (value) {
                setState(() {
                  if(value != null)
                    twoChecked = value;
                }
                );
              },
            ),
          ),
          ListTile(
            leading: Text('앱 알림'),
            trailing: Switch(
              value: threeChecked,
              onChanged: (value) {
                setState(() {
                  if(value != null)
                    threeChecked = value;
                }
                );
              },
            ),
          ),
          ListTile(
            leading: Text('공지사항'),
            trailing: IconButton(onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Text('FAQ'),
            trailing: IconButton(onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Text('만든이'),
            trailing: IconButton(onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios)),
          ),
        ],
      ),
    );
  }
}
