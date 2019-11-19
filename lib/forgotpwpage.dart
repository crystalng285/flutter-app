import 'package:flutter/material.dart';
import 'package:flutter_chat/numverpage.dart';
import 'package:flutter_chat/secondpage.dart';

//------------------FORGOT PASSWORD PAGE ----------------------------------
class Num_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumVerification(),
    );
  }
}

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
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 82),
          ),
          Row(
            children: <Widget>[
              BackButton(
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                  )),
              Text(
                "Forget password",
                style: TextStyle(
                  color: Colors.black,
                  //color:  const Color(0xFFD8D8D8),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Image(
            image: AssetImage("assets/images/AppIcon.png"),
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),

          SizedBox(height: 30),
          Image.asset("assets/images/Noproblem.png"),

          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              //--------Email-----------
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your email",
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),


              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                ),
              ),
              GestureDetector(
                onTap: _conbutton,
                child: Image.asset("assets/images/Buttoncon.png"),
              ),

            ]),
          )

        ]
        )
    );
  }

  void _conbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Num_Page()),
    );
  }
}

