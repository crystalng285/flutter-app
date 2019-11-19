import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/friend/pages/friendlist.dart';

class Activepage extends StatefulWidget {
  @override
  _ActivepageState createState() => _ActivepageState();
}

class _ActivepageState extends State<Activepage> {

  final topBar = AppBar(
    backgroundColor: Colors.teal, // cua Appbar
    //centerTitle: true, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: BackButton(color: Colors.black), //hang dau
    title: SizedBox(
        height: 35.0,
        child: Text(
          'Active',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "NunitoSans",
            fontStyle: FontStyle.normal,
            fontSize: 30,
          ),
        )),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.search),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: topBar,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: friendList(),
      ),

    );
  }
}
