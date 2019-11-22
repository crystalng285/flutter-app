import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chatConversation.dart';
class messageRequest extends StatefulWidget {
  @override
  _messageRequestState createState() => _messageRequestState();
}

class _messageRequestState extends State<messageRequest> {
  final topBar = AppBar(
    backgroundColor: Colors.white, // cua Appbar
    centerTitle: true, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: CloseButton(), //hang dau
    title: SizedBox(
        height: 20.0,
        child: Text(
          'Message Requests',
          style: TextStyle(
              color:  const Color(0xff404040),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: topBar,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              chatConversation()
            ],
          ),
        ),

    );
  }
}

