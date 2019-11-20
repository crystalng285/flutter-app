import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chatConversation.dart';


class RecentChatSection extends StatelessWidget {
  final recentText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Recent Chat",
        style: TextStyle(
            color: const Color(0xff343434),
            fontWeight: FontWeight.w800,
            fontFamily: "NunitoSans",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
      ),
      Row(
        children: <Widget>[
          Text("See all",
              style: TextStyle(
                  color: const Color(0xff9a9a9a),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0))
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          recentText,
          chatConversation(),
        ],
      ),
    );
  }
}
