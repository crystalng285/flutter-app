import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:flutter_chat/tabview/message/message_screen.dart';
import 'package:flutter_chat/utils/convertFromTimeStamp.dart';
import 'package:http/http.dart' as HTTP;

class chatConversation extends StatefulWidget {
  @override
  _chatConversationState createState() => _chatConversationState();
}

class _chatConversationState extends State<chatConversation> {
  List<ChatModel> _chaters;
  final String url = "http://5cd46056b231210014e3d893.mockapi.io/api/v1/users";
  @override
  void initState() {
    super.initState();
    _chaters = [];
    // API
    getJsonData();
  }

  void getJsonData() async {
    var response = await HTTP.get(Uri.encodeFull(url)); // using method get without body
    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');

    List data = json.decode(response.body); // [ {} ]

    // parser
    data.forEach((item) {
      ChatModel chatmodel = ChatModel.fromJson(item);
      _chaters.add(chatmodel);
    });

    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => messageScreen()),
        );
      },
      child: Container(
        //color: Colors.yellow,
        height: 350,
        child: ListView.builder(
           // padding: EdgeInsets.only(top: 5),
            itemCount: _chaters.length,
            itemBuilder: (context, i) => Container(
                  child: Column(
                    children: <Widget>[
                      Divider(
                        height: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor:
                                      Theme.of(context).primaryColor,
                                  backgroundImage:
                                      NetworkImage(_chaters[i].avatarUrl),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        _chaters[i].name,
                                        style: TextStyle(
                                            color: const Color(0xff26a6c6),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Helvetica",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    _chaters[i].unread
                                        ? Text(
                                            _chaters[i].message,
                                            style: const TextStyle(
                                                color: const Color(0xff404040),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "NunitoSans",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            overflow: TextOverflow
                                                .ellipsis, // text co dai cung bi che di
                                          )
                                        : Text(
                                            _chaters[i].message,
                                            style: const TextStyle(
                                                color: const Color(0xff797979),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Helvetica",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            overflow: TextOverflow
                                                .ellipsis, // text co dai cung bi che di
                                          ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                converFromTimeStamp(_chaters, i),
                                _chaters[i].unread
                                    ? Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 40.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'NEW',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
