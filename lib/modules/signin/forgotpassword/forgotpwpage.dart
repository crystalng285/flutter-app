import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/signin/forgotpassword/mobilenumber/enterphonenumber.dart';

//------------------FORGOT PASSWORD PAGE ----------------------------------
class ForgotPw extends StatefulWidget {
  @override
  _ForgotPwState createState() => _ForgotPwState();
}
class _ForgotPwState extends State<ForgotPw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                BackButton(
                  color: Colors.black,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Forget password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NunitoSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Image(
                image: AssetImage("assets/images/AppIcon.png"),
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
            Image.asset("assets/images/Noproblem.png"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Enter your email",
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: _conbutton,
              child: Image.asset("assets/images/Buttoncon.png"),
            ),
          ]),
        ));
  }

  void _conbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnterPhoneNumber()),
    );
  }
}
