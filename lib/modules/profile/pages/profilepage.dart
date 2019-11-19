import 'package:flutter/material.dart';
import 'package:flutter_chat/models/conversation_model.dart';
import 'package:flutter_chat/tabview/profile/profile_menulist.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(currentUser.avatarUrl),
                    ),
                    SizedBox(height: 5,),
                    Text(currentUser.name,
                        style: const TextStyle(
                            color: const Color(0xff404040),
                            fontWeight: FontWeight.w800,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0)),
                    SizedBox(height: 5,),
                    Text(currentUser.country,
                        style: const TextStyle(
                            color: const Color(0xffbebebe),
                            fontWeight: FontWeight.w700,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: menuList(),
                //Text('Hello')
              ),
            ),
          ],
        )
    );
  }
}
