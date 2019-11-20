import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chat_recentchatsection.dart';
import 'package:flutter_chat/models/chat_model.dart';

class RecentChatList extends StatelessWidget {
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
    var deviceSize = MediaQuery.of(context).size; // lam cac icon fit better

    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => index == 0
            ? SizedBox(
          child: RecentChatSection(),
          height: deviceSize.height * 0.6,
          //height: double.infinity,
        )
            : Container()
    );
  }
}
