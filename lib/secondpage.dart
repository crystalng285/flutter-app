import 'package:flutter/material.dart';
import 'package:flutter_chat/dashboard.dart';
import 'package:flutter_chat/forgotpwpage.dart';
import 'package:http/http.dart' as HTTP;
import 'package:flutter_chat/chatpage.dart';


//------------------_SECOND PAGE ----------------------------------

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _pw;
  //final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _su = new Text("Sign up");
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _title;
  String _textsignin;
  String _textsignup;
  String _buttonurl;
  bool _flag; //check

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = "Sign in";
    _flag = true;
    _textsignin = "Don't have an account?";
    _textsignup = "Sign up";
    _buttonurl = "assets/images/Button.png";
    _pw = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
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
                _title,
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
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                //_isABC ?  : Container(),
                _flag == true
                    ? Container()
                    : TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                        ),
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontFamily: "NunitoSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                //--------Email-----------
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: TextStyle(
                    fontFamily: "NunitoSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 21, left: 120),
                  ),
                ),
                //--------Password-----------
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: (){
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
                  obscureText: _pw, //* or .
                  controller: passwordController,
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, right: 30),
                  ),
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
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                  ),
                ),
                MaterialButton(
                  child: Image(image: AssetImage(_buttonurl)),
                  onPressed: _signin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 24)),
                    Text(_textsignin,
                        style: TextStyle(
                          color: Color(0xff9b9b9b),
                          fontWeight: FontWeight.w600,
                          fontFamily: "NunitoSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        )),
                    GestureDetector(
                      onTap: _signuptext,
                      child: Text(_textsignup),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Color(0xff9b9b9b),
                    fontWeight: FontWeight.w600,
                    fontFamily: "NunitoSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  child: Image(image: AssetImage("assets/images/Facebook.png")),
                  onPressed: () {},
                ),

                SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  child: Image(image: AssetImage("assets/images/Google.png")),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signuptext() {
    setState(() {
      _title = "Sign up";
      _textsignup = "Sign in";
      _textsignin = "Already have an account?";
      _flag = false;
      _buttonurl = "assets/images/Buttonsu.png";
    });
  }

  void _forgotpw() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPwPage()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Email text field: ${emailController.text}");
    print("Password text field: ${passwordController.text}");
  }

  Future _signin() async {
    var url = 'http://5cd46056b231210014e3d893.mockapi.io/api/v1/login';
    var response = await HTTP.post(url, body: {
      "id": "1",
      "email": emailController.text,
      "password": passwordController.text
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // navigate to home
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      }

    } else {
      _ackAlert(context);
    }
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: const Text('Your login is invalid'),
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
}

class ForgotPwPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fgpw",
      home: ForgotPw(

      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black), // mau icon
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.white, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))

      ),
      home: Chat_Page(),
    );
  }
}
