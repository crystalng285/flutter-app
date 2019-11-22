import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/message/pages/button_newgroup/createnewgroup.dart';
import 'package:flutter_chat/tabview/message/contactlist.dart';
import 'package:flutter_chat/utils/searchbar.dart';

class createNewGroup extends StatefulWidget {
  @override
  _createNewGroupState createState() => _createNewGroupState();
}

class _createNewGroupState extends State<createNewGroup> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // cua Appbar
        centerTitle: true,
        // get the title text centered perfectly between the 2 icons
        elevation: 7.0,
        // do cao, mo` mo` cua app bar
        leading: CloseButton(),
        //hang dau
        title: SizedBox(
            height: 20.0,
            child: Text(
              'Create New Group',
              style: TextStyle(
                  color: const Color(0xff404040),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewGroup()),
                  );
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                )),
            //Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg.png",
          ),
//search section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(child: SearchBar()),
                Container(height: 500, child: contactList()),
              ],
            ),
          )

          //button section
        ],
      ),
    );
  }
}
