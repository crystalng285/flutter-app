import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/signin/forgotpassword/forgotpwpage.dart';

class renderEmailPasswordForm extends StatefulWidget {
  @override
  _renderEmailPasswordFormState createState() =>
      _renderEmailPasswordFormState();
}

class _renderEmailPasswordFormState extends State<renderEmailPasswordForm> {
  // bool flag; //check
  bool _pw;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   flag = true;
    _pw = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        flag == true
//            ? Container()
//            : TextFormField(
//          decoration: InputDecoration(
//            labelText: "Full Name",
//          ),
//          keyboardType: TextInputType.text,
//          style: TextStyle(
//            fontFamily: "NunitoSans",
//            fontStyle: FontStyle.normal,
//            fontSize: 14.0,
//          ),
//        ),
        //--------Email-----------
        TextField(
            decoration: InputDecoration(
                // border: InputBorder.none,
                labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            style: TextStyle(
              fontFamily: "NunitoSans",
              fontStyle: FontStyle.normal,
              fontSize: 14.0,
            )),
        Container(
          margin: EdgeInsets.only(top: 21, bottom: 10),
          child: TextField(
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _pw = !_pw;
                    });
                  },
                  icon: Icon(_pw ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontFamily: "NunitoSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0,
              ),
              obscureText: _pw,
              //* or .
              controller: passwordController),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: _forgotpw,
              child: Opacity(
                opacity: 0.8,
                child: Text(
                  "Forgot password?",
                  style: const TextStyle(
                      color: const Color(0xff9b9b9b),
                      fontWeight: FontWeight.w600,
                      fontFamily: "NunitoSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _forgotpw() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPw()),
    );
  }
}
