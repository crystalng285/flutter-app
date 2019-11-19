import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:http/http.dart' as HTTP;
import 'dart:convert';
class contactList extends StatefulWidget {
  @override
  _contactListState createState() => _contactListState();
}

class _contactListState extends State<contactList> {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: _chaters.length,
        itemBuilder: (context, i) => Container(
          //color: Colors.amberAccent,
          child: Column(
            children: <Widget>[
              Divider(
                height: 7.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                  NetworkImage(_chaters[i].avatarUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _chaters[i].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Helvetica",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                    ),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}


