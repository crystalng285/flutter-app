import 'package:flutter/material.dart';
import 'package:flutter_chat/models/profile_model.dart';

class menuList extends StatefulWidget {
  @override
  _menuListState createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: profilemenu.length + 2,
        itemBuilder: (BuildContext context, int index){
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == profilemenu.length + 1) {
            return SizedBox(height: 100.0);
          }
          return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
//                border: _selectedOption == index - 1
//                    ? Border.all(color: Colors.red)
//                    : null,
              ),
              child: ListTile(
                leading: profilemenu[index - 1].icon,
                title:
                    Row(
                      children: <Widget>[
                        Text(
                          profilemenu[index - 1].title,
                          style: TextStyle(
                              color:  const Color(0xff404040),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NunitoSans",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
//                    color: _selectedOption == index - 1
//                        ? Colors.black
//                        : Colors.grey[600],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: IconButton(icon: Icon(Icons.arrow_forward_ios),
                              iconSize: 20, onPressed: (){},),
                        )
                      ],
                    ),
              )
          );
        }
    );
  }
}
