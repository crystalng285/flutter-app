import 'package:flutter/material.dart';

import 'package:flutter_chat/tabview/message/contactlist.dart';
import 'package:flutter_chat/modules/message/pages/button_newcontact/message_newcontact.dart';
import 'package:flutter_chat/modules/message/pages/button_newgroup/message_newgroup.dart';
import 'package:flutter_chat/utils/renderAppbar.dart';
import 'package:flutter_chat/utils/renderNavigationBar.dart';
import 'package:flutter_chat/utils/searchbar.dart';

class createNewChat extends StatefulWidget {
  @override
  _createNewChatState createState() => _createNewChatState();
}

class _createNewChatState extends State<createNewChat> {
  final contactText = Text(
    "Your Contact",
    style: TextStyle(
        color: const Color(0xff343434),
        fontWeight: FontWeight.w800,
        fontFamily: "NunitoSans",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
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

  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: renderAppBar("Start a New Chat", check),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg.png",
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 5),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(16.0),
                  height: 50,
                  child: SearchBar(),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, bottom: 16, top: 16),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          child: FloatingActionButton(
                            heroTag: 1,
                            child: Icon(Icons.group_add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => createNewContact()),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      _renderText("Add New Contact"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, bottom: 16, top: 16),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          child: FloatingActionButton(
                            heroTag: 2,
                            child: Icon(Icons.group_add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => createNewGroup()),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      _renderText("Create Group"),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      contactText,
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(height: 400, child: contactList()),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RenderNavigationBar(),
    );
  }
}
