import 'package:flutter/material.dart';
import 'package:flutter_chat/secondpage.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App title",
      home: FirstPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

//------------------FIRST PAGE ----------------------------------
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: GestureDetector(
        onTap: action,
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/AppIcon.png"),
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Image(
                    image: AssetImage("assets/images/Flutter.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage("assets/images/text.png"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void action() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }
}
