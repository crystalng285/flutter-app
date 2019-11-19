import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chatConversation.dart';
import 'package:flutter_chat/tabview/message/message_newlist.dart';
import 'package:flutter_chat/tabview/message/message_request.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final topBar = AppBar(
    backgroundColor: Colors.teal, // cua Appbar
    //centerTitle: true, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: BackButton(color: Colors.black), //hang dau
    title: SizedBox(
        height: 35.0,
        child: Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "NunitoSans",
            fontStyle: FontStyle.normal,
            fontSize: 30,
          ),
        )),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.search),
      ),
    ],
  );
  final text_addnewlist = Text("+New chat or create group",
    style: const TextStyle(
        color:  const Color(0xff797979),
        fontWeight: FontWeight.w700,
        fontFamily: "NunitoSans",
        fontStyle:  FontStyle.normal,
        fontSize: 13.0
    ),);
  final text_request = Text("Message Request",
    style: const TextStyle(
        color:  const Color(0xff797979),
        fontWeight: FontWeight.w700,
        fontFamily: "NunitoSans",
        fontStyle:  FontStyle.normal,
        fontSize: 13.0
    ),);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/bg.png",
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        child: Icon(Icons.group_add),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => createNewChat()),
                          );
                        },
                      ),
                    ),
                  ),
                  text_addnewlist
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  //height: 500,
                  child: chatConversation()),
            ),
            Expanded(
              flex: 0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        heroTag: "btn3",
                        child: Icon(Icons.chat_bubble_outline),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => messageRequest()),
                          );
                        },
                      ),
                    ),
                  ),
                  text_request,
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
