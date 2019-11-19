import 'package:flutter/material.dart';

import 'package:flutter_chat/tabview/message/contactlist.dart';
import 'package:flutter_chat/tabview/message/message_newcontact.dart';
import 'package:flutter_chat/tabview/message/message_newgroup.dart';
import 'package:flutter_chat/tabview/message/searchbar.dart';
import 'package:flutter_chat/tabview/message/searchuser.dart';

class createNewChat extends StatefulWidget {
  @override
  _createNewChatState createState() => _createNewChatState();
}

class _createNewChatState extends State<createNewChat> {
  final topBar = AppBar(
    backgroundColor: Colors.white, // cua Appbar
    centerTitle: true, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: CloseButton(), //hang dau
    title: SizedBox(
        height: 20.0,
        child: Text(
          'Start a New Chat',
          style: TextStyle(
              color:  const Color(0xff404040),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
        )),

  );
  final contactText = Text(
    "Your Contact",
    style: TextStyle(
        color: const Color(0xff343434),
        fontWeight: FontWeight.w800,
        fontFamily: "NunitoSans",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: topBar,
        body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/bg.png",
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    //color: Colors.grey,
                    height: 50,
                    child: SearchBar(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left:16.0),
                    height: 80,
                    decoration: BoxDecoration(),
                    //child: ActiveList(),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          child: Icon(Icons.group_add),
                          heroTag: "btn 1",
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => createNewContact()),
                            );
                          },
                        ),

                        Text("Add New Contact",
                          style: const TextStyle(
                              color:  const Color(0xff797979),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NunitoSans",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.0
                          ),)
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(left:16.0),
                    decoration: BoxDecoration(
                    ),
                    //child: ActiveList(),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          child: Icon(Icons.group_add),
                          heroTag: "btn 2",
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => createNewGroup()),
                            );
                          },
                        ),

                        Text("Create Group",
                          style: const TextStyle(
                              color:  const Color(0xff797979),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NunitoSans",
                              fontStyle:  FontStyle.normal,
                              fontSize: 13.0
                          ),)
                      ],
                    ),
                  ),

                  Container(
                    height: 410,
                      margin: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        contactText,
                        Container(height: 380,child: contactList()),
                      ],
                    )

                  )

                ],
              ),
            ),

          ],
        ),

    );
  }
}
