import 'package:flutter/material.dart';

Widget renderAppBar(String title, bool check) {
  //check = false; //
  return AppBar(
      backgroundColor: Colors.white70,
      actionsIconTheme: IconThemeData(color: Colors.teal),
      centerTitle: true,
      // get the title text centered perfectly between the 2 icons
      elevation: 7.0,
      // do cao, mo` mo` cua app bar
      leading: CloseButton(),
      //hang dau
      title: SizedBox(
          height: 20.0,
          child: Text(
            title,
            style: TextStyle(
                color: const Color(0xff404040),
                fontWeight: FontWeight.w700,
                fontFamily: "NunitoSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          )),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: check == false
                ? IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {},
                  )
                : Container())
      ]);
}
