import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chat_activelist.dart';
import 'package:flutter_chat/chat/chat_list.dart';
import 'package:flutter_chat/chat/chat_recentchatlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 200,
          child: ChatList(),
        ),
        Container(
          height: 140,
          child: ActiveList(),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 360,
          child: RecentChatList(),
        ),
      ],
    );
  }
}
