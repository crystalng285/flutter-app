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

  Widget _renderText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: const Color(0xff797979),
          fontWeight: FontWeight.w700,
          fontFamily: "NunitoSans",
          fontStyle: FontStyle.normal,
          fontSize: 13.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/bg.png",
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 16),
          child: Column(
            children: <Widget>[
              //Add chat group button
              Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
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
                    SizedBox(width: 16,),
                    _renderText("+New chat or create group")
                  ],
                ),
              ),
              //Chat
              Expanded(
                flex: 1,
                child: chatConversation(),
              ),

              //Message Request button
              Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
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
                    SizedBox(width: 16,),
                    _renderText("Message Request")
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
