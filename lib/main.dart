import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/signin/signinpage.dart';

void main() => runApp(MyApp());


//created a class CommonThings has static Size = use it throughout the app.
class CommonThings {
  static Size size;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App title",
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
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
}
