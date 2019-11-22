import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/active.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:flutter_chat/modules/message/pages/message_screen.dart';

import 'package:http/http.dart' as HTTP;
import 'dart:convert';


class ActiveAccount extends StatefulWidget {
  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  //API
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
    var response = await HTTP.get(Uri.encodeFull(url), headers: {
      "Accept": "application/json"
    }); // using method get without body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List data = json.decode(response.body); // [ {} ]

    // parser
    data.forEach((item) {
      ChatModel chatmodel = ChatModel.fromJson(item);
      _chaters.add(chatmodel);
    });

    this.setState(() {});
  }

  final activeText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Active",
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


  Widget activeAccountPicture()
  {
    return Expanded(
      child: new Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: new ListView.builder(
          scrollDirection: Axis.horizontal, // cac Listview dc xep theo chieu ngang
          itemCount: _chaters.length,
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(_chaters[index].avatarUrl),
                        ),
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => messageScreen()),
                          );
                        }
                    ),
                    SizedBox(height: 8),
                    Text(
                      _chaters[index].lastname,
                      style: TextStyle(
                          color: const Color(0xff404040),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Helvetica",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                    ),
                  ],
                ),
              ),
//            Container(
//              width: 60.0,
//              height: 60.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: NetworkImage(
//                        dummyData[index].avatarUrl)),
//              ),
//              margin: const EdgeInsets.symmetric(horizontal: 8.0), //khoang cach giua cac story
//            ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Activepage()),
                );
              },
              child: activeText),
          activeAccountPicture()

        ],
      ),
    );
  }
}
