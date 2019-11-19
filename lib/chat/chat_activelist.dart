import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/chat_activeaccount.dart';
import 'package:flutter_chat/models/chat_model.dart';

import 'package:http/http.dart' as HTTP;
import 'dart:convert';

class ActiveList extends StatefulWidget {
  @override
  _ActiveListState createState() => _ActiveListState();
}

class _ActiveListState extends State<ActiveList> {


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
    var deviceSize = MediaQuery.of(context).size; // lam cac icon fit better

    return ListView.builder(
        itemCount: _chaters.length,
        itemBuilder: (context, index) => index == 0
            ? SizedBox(
          child: ActiveAccount(),
          height: deviceSize.height * 0.2,
        )
            : Container()
    );
  }
}


