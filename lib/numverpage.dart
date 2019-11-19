import 'package:flutter/material.dart';
import 'package:flutter_chat/codepage.dart';
import 'package:flutter_chat/forgotpwpage.dart';
//import 'dart:convert';

import 'package:international_phone_input/international_phone_input.dart';


class NumVerification extends StatefulWidget {
  @override
  _NumVerificationState createState() => _NumVerificationState();
}

class _NumVerificationState extends State<NumVerification> {
  String phoneNumber;
  String phoneIsoCode;
  bool _flag;

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {

    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
      _flag = true;

      if(number.length >= 5)
      {
        print("number = ${number}");
        _enterCode();
      }
    else
      {
        //_ackAlert(context);
      }
    });
  }

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
              Padding(
                  padding: EdgeInsets.only(
                left: 24,
              )),
              Text(
                "My Mobile Number is",
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
          SizedBox(
            height: 62,
          ),
          Container(
            height: 49,
            width: 291,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            //padding: EdgeInsets.all(42),
            child: Stack(
              children: <Widget>[
                  InternationalPhoneInput(
                    hintText: "Mobile Number",

                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phoneNumber,
                      initialSelection: phoneIsoCode,
                  ),
                //Check flag



              ],
            ),
          ),
          SizedBox(height: 25,),
          Image.asset("assets/images/phonetext.png"),

        ]
        )
    );
  }
  void _enterCode(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnterCode()),
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          //content: const Text('Your login is invalid'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },

    );
  }
  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      var confirmedNumber = internationalizedPhoneNumber;
    });
  }
}
class EnterCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnterCodePage(
        phonetext: "1 647 781 5256",
      ),
    );
  }
}
