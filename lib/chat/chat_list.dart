import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/home/pages/home_stories.dart';
import 'package:flutter_chat/models/chat_model.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size; // lam cac icon fit better

    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => index == 0
            ? SizedBox(
          child: HomeStories(),
          height: deviceSize.height * 0.25,
        )
            : Container()
    );
  }
}

