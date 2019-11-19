import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:flutter_chat/models/conversation_model.dart';
import 'package:flutter_chat/modules/friend/pages/friendlist.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as HTTP;
import 'dart:convert';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final updateText = Text(
    "Recently Updates",
    style: TextStyle(
        color: const Color(0xff343434),
        fontWeight: FontWeight.w800,
        fontFamily: "NunitoSans",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
  );
  final seeallText = Text(
    "See all",
    style: TextStyle(
        color: const Color(0xff343434),
        fontWeight: FontWeight.w800,
        fontFamily: "NunitoSans",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
  );
  File _image;
  _showSelectImageDialog() {
    return Platform.isIOS ? _iosBottomSheet() : _androidDialog();
  }

  //Platform ios
  _iosBottomSheet(){
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Add Photo'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Take Photo'),
              onPressed: () => _handleImage(ImageSource.camera),
              //onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('Choose From Gallery'),
              //onPressed: () {},
              onPressed: () => _handleImage(ImageSource.gallery),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
    print('ios');
  }

  //Platform android
  _androidDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Add Photo'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Take Photo'),
              //onPressed: () {},
              onPressed: () => _handleImage(ImageSource.camera),
            ),
            SimpleDialogOption(
              child: Text('Choose From Gallery'),
              //onPressed: () {},
              onPressed: () => _handleImage(ImageSource.gallery),
            ),
            SimpleDialogOption(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );


  }

  //Choose image from gallery

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    print('ios');

    File imageFile = await ImagePicker.pickImage(source: source);
    // if (imageFile != null) {
    //imageFile = await _cropImage(imageFile);
    setState(() {
      _image = imageFile;
    });
    // }
  }

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
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/bg.png",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: GestureDetector(
                  onTap: _showSelectImageDialog,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          height: 177.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(currentUser.avatarUrl)),
                          ),
                        ),
                        Positioned(
                            child: CircleAvatar(
                              backgroundColor: Colors.white30,
                              radius: 25.0, // ban kinh circle avatar
                              child: Icon(
                                Icons.add_a_photo,
                                size: 20.0,
                                color: Colors.white,
                              ),

                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(),
                    //child: ActiveList(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        updateText,
                        Flexible(child: friendList()),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(),
                    //child: ActiveList(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        seeallText,
                        Flexible(child: friendList()),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
