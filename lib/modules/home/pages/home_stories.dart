import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:http/http.dart' as HTTP;
import 'dart:convert';



class HomeStories extends StatefulWidget {
  @override
  _HomeStoriesState createState() => _HomeStoriesState();
}

class _HomeStoriesState extends State<HomeStories> {
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

  final storiesText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Story",
        style: TextStyle(
            color: const Color(0xff343434),
            fontWeight: FontWeight.w800,
            fontFamily: "NunitoSans",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
      ),
      Text("See all",
          style: TextStyle(
              color: const Color(0xff9a9a9a),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle: FontStyle.normal,
              fontSize: 12.0))
    ],
  );

  Widget _storiesPicture(){
    return Expanded(
      child: new Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: new ListView.builder(
          scrollDirection:
          Axis.horizontal, // cac Listview dc xep theo chieu ngang
          itemCount: _chaters.length,
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 120.0,
                height: 177.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(_chaters[index].avatarUrl)),
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: 8.0), //khoang cach giua cac story
              ),
              index == 0
                  ? Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 25.0, // ban kinh circle avatar
                    child: Icon(
                      Icons.add_a_photo,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ))
                  : Container()
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
          GestureDetector(child: storiesText, onTap: (){
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => CameraPage()),
//            );
          },),
          _storiesPicture(),
        ],
      ),
    );
  }
}