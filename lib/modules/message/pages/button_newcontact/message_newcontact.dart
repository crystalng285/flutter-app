import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/renderAppbar.dart';
class createNewContact extends StatefulWidget {
  @override
  _createNewContactState createState() => _createNewContactState();
}

class _createNewContactState extends State<createNewContact> {
  final topBar = AppBar(
   // backgroundColor: Colors.white, // cua Appbar
    centerTitle: true, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: CloseButton(), //hang dau
    title: SizedBox(
        height: 20.0,
        child: Text(
          'Add New Contact',
          style: TextStyle(
              color:  const Color(0xff404040),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
        )),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
            color: Colors.red
        ),
      ),
    ],
  );
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      appBar: renderAppBar("Add New Contact", check
      ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                ),
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),


    );
  }
}
