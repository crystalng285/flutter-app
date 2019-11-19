import 'package:flutter/material.dart';
import 'package:flutter_chat/dashboard.dart';
import 'package:flutter_chat/models/category.dart';
//API

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as HTTP;

class Chat_Page extends StatefulWidget {
  @override
  _Chat_PageState createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {


  Widget _renderAppBar(){
    return AppBar(
      backgroundColor: Colors.teal, // cua Appbar
      //centerTitle: true, // get the title text centered perfectly between the 2 icons
      elevation: 7.0, // do cao, mo` mo` cua app bar
      leading: Icon(Icons.camera_alt), //hang dau
      title: SizedBox(
          height: 35.0,
          child: Text(
            'Flutter',
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
          child: IconButton(icon: Icon(Icons.search), onPressed: (){
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => ChatPage()),
//          );

          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _renderAppBar(),
        body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/bg.png",
            ),
            // ChatBody(),

          ],
        ),
        bottomNavigationBar:
            DashBoard()
        //CategorySelector()

    );
  }
//Khai bao API
  final String url = "http://5cd46056b231210014e3d893.mockapi.io/api/v1/users";
  List dummyData = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await HTTP.get(Uri.encodeFull(url), headers: {
      "Accept": "application/json"
    }); // using method get without body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    setState(() {
      dummyData = json.decode(response.body);
    });

    return "Success";
  }


}


//class Chat_Page extends StatelessWidget {
//  final topBar = AppBar(
//    backgroundColor: Colors.teal, // cua Appbar
//    //centerTitle: true, // get the title text centered perfectly between the 2 icons
//    elevation: 7.0, // do cao, mo` mo` cua app bar
//    leading: Icon(Icons.camera_alt), //hang dau
//    title: SizedBox(
//        height: 35.0,
//        child: Text(
//          'Flutter',
//          style: TextStyle(
//            fontWeight: FontWeight.w700,
//            fontFamily: "NunitoSans",
//            fontStyle: FontStyle.normal,
//            fontSize: 30,
//          ),
//        )),
//    actions: <Widget>[
//      Padding(
//        padding: const EdgeInsets.only(right: 12.0),
//        child: IconButton(icon: Icon(Icons.search), onPressed: (){
////          Navigator.push(
////            context,
////            MaterialPageRoute(builder: (context) => ChatPage()),
////          );
//
//        }),
//      ),
//    ],
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        resizeToAvoidBottomPadding: false,
//        appBar: topBar,
//        body: Stack(
//          children: <Widget>[
//            Image.asset(
//              "assets/images/bg.png",
//            ),
//             ChatBody(),
//
//          ],
//        ),
//        bottomNavigationBar:
//            tabViewMenu()
//        //CategorySelector()
//
//    );
//  }
////Khai bao API
//  final String url = "http://5cd46056b231210014e3d893.mockapi.io/api/v1/users";
//  List dummyData = [];
//
//
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    this.getJsonData();
//  }
//
//  Future<String> getJsonData() async {
//    var response = await HTTP.get(Uri.encodeFull(url), headers: {
//      "Accept": "application/json"
//    }); // using method get without body
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
//
//    setState(() {
//      dummyData = json.decode(response.body);
//    });
//
//    return "Success";
//  }
//
//
//}

//  final topBar = AppBar(
//    backgroundColor: Colors.teal, // cua Appbar
//    //centerTitle: true, // get the title text centered perfectly between the 2 icons
//    elevation: 7.0, // do cao, mo` mo` cua app bar
//    leading: Icon(Icons.camera_alt), //hang dau
//    title: SizedBox(
//        height: 35.0,
//        child: Text(
//          'Flutter',
//          style: TextStyle(
//            fontWeight: FontWeight.w700,
//            fontFamily: "NunitoSans",
//            fontStyle: FontStyle.normal,
//            fontSize: 30,
//          ),
//        )),
//    actions: <Widget>[
//      Padding(
//        padding: const EdgeInsets.only(right: 12.0),
//        child: Icon(Icons.search),
//      ),
//    ],
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomPadding: false,
//      appBar: topBar,
//      body: Stack(
//        children: <Widget>[
//          Image.asset(
//            "assets/images/bg.png",
//          ),
//          GestureDetector(
//            onTap: getJsonData,
//            child: ChatBody(),
//
//            ),
//          ]
//      ),
//      bottomNavigationBar: CategorySelector(),
//    );
//  }
//
//
//}

//class Chat_Page extends StatefulWidget {
//  @override
//  _Chat_PageState createState() => _Chat_PageState();
//}
//
//class _Chat_PageState extends State<Chat_Page> with SingleTickerProviderStateMixin {
//
//  TabController _tabController;
//  int _selectedPage = 0;
//  final _pageOptions = [
//    CameraScreen(),
//    ChatScreen(),
//    CallScreen(),
//    StatusScreen()
//  ];
//  static const List<Widget> _widgetOptions = <Widget>[
//    Text(
//      'Index 0: Home',
//    ),
//    Text(
//      'Index 1: Chat',
//
//    ),
//    Text(
//      'Index 2: Call',
//    ),
//    Text(
//      'Index 3: Status',
//    ),
//  ];
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//  }
//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }

////      bottomNavigationBar: Material(
////
////        child: Container(
////          height: 100,
////          decoration: BoxDecoration(
////            border: Border.all(color: Colors.grey),
////          ),
////          child: TabBar(
////            controller: _tabController,
////            indicatorColor: Colors.blue, //press each tab
////
////            labelColor: Colors.teal,
////
////
////            tabs: <Widget>[
////              Tab(
////                icon: Icon(Icons.home,
////                ),
////              ),
////              Tab(
////                icon: Icon(Icons.chat_bubble_outline),
////              ),
////              Tab(
////                icon: Icon(Icons.camera_alt),
////              ),
////              Tab(
////                icon: Icon(Icons.people),
////              ),
////            ],
////          ),
////        ),
////      ),
//    bottomNavigationBar: BottomNavigationBar(
//
//      items: [
//        BottomNavigationBarItem(
//          icon: Icon(Icons.home), title: Text('Home'),
//
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.chat_bubble_outline), title: Text('Chat'),
//
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.camera_alt), title: Text('Camera'),
//        ),
//        BottomNavigationBarItem(
//          icon: Icon(Icons.people), title: Text('People'),
//        ),
//      ],
//      selectedItemColor: Colors.teal,
//      unselectedItemColor: Colors.grey,
//      currentIndex: _selectedPage,
//      onTap: (int index){
//        setState(() {
//          _selectedPage = index;
//        });
//
//
//
//      },
//
//    ),
//
//
//    );
//  }
//}
//class Trypage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "What's app!",
//      theme: ThemeData(
//        primaryColor: Color(0xff075E54),
//        accentColor: Color(0xff25D366),
//      ),
//      home: Whatapp(),
//    );
//  }
//}
