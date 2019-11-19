import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chat_recentchatsection.dart';
import 'package:flutter_chat/models/chat_model.dart';

class RecentChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size; // lam cac icon fit better

    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => index == 0
            ? SizedBox(
          child: RecentChatSection(),
          height: deviceSize.height * 0.5,
          //height: double.infinity,
        )
            : Container()
    );
  }
}
