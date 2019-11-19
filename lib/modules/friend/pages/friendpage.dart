import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/friend/pages/friendlist.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg.png",
          ),
          friendList()
          //RecentChatSection(),
        ],
      ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () => print("Open")),
    );
  }
}
