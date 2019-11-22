import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

//Truyen
class EnterCodePage extends StatefulWidget {
  EnterCodePage({
    this.phonetext,
  });

  final String phonetext;

  @override
  _EnterCodePageState createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  String _text;
  String _textphone;

  bool flag;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    flag = true;

    if (this.widget.phonetext == null) {
      _textphone = "you the pin at +" + this.widget.phonetext + "";
    } else {
      _text = "Check your SMS messages, we have sent ";
      _textphone = "you the pin at +" + this.widget.phonetext;
    }
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
                "My Code is",
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

          Padding(
            padding: const EdgeInsets.all(20),
            child: PinPut(
              fieldsCount: 4,
              onSubmit: (String pin) => _showSnackBar(pin, context),
            ),
          ),

          Column(
            children: <Widget>[
              Text(_text),
              SizedBox(
                height: 10,
              ),
              Text(_textphone),
            ],
          ),

          SizedBox(
            height: 44,
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 31)),
              GestureDetector(
                onTap: _receivemess,
                child: Image.asset("assets/images/receivemes.png"),
              ),
            ],
          ),

          SizedBox(
            height: 200,
          ),

          flag == true
              ? Container()
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 10,),
              Text(" Processing..."),
            ],
          ),
          //Image.asset("assets/images/processing.png"),
        ]));
  }

  void _receivemess() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    if (pin.length == 4) {
      setState(() {
        flag = false;
        Future.delayed(Duration(seconds: 5), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
        }
        );
      });
    } else {
      //onProcessing();
    }
  }

}
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "materialapp",
      home: ChatPage(),
    );
  }
}
