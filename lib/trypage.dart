//import 'package:flutter/material.dart';
//import 'package:flutter_chat/pages/calls_screen.dart';
//import 'package:flutter_chat/pages/camera_screen.dart';
//import 'package:flutter_chat/chat/chat_screen.dart';
//import 'package:flutter_chat/pages/status_screen.dart';
//
//
//
//class Whatapp extends StatefulWidget {
//  @override
//  _WhatappState createState() => _WhatappState();
//}
//
//class _WhatappState extends State<Whatapp> with SingleTickerProviderStateMixin {
//
//  TabController _tabController;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
//  }
//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        title: Text("What's app!",),
//        elevation: 0.7,
//        bottom: TabBar(
//          controller: _tabController,
//          indicatorColor: Colors.grey,
//          tabs: <Widget>[
//            Tab(
//              icon: Icon(Icons.camera_alt),
//            ),
//            Tab(
//              text: "Chats",
//            ),
//            Tab(
//              text: "Status",
//            ),
//            Tab(
//              text: "Calls",
//            ),
//          ],
//        ),
//        actions: <Widget>[
//          Icon(Icons.search), Padding(padding: EdgeInsets.symmetric(horizontal: 0.5),),
//          Icon(Icons.more_vert)
//        ],
//      ),
//
//      body: TabBarView(
//        controller: _tabController,
//        children: <Widget>[
//          CameraScreen(),
//          ChatScreen(),
//          CallScreen(),
//          StatusScreen()
//        ],
//      ),
//      floatingActionButton: FloatingActionButton(
//          backgroundColor: Theme.of(context).primaryColor,
//          child: Icon(Icons.person_add,
//          color: Colors.white),
//
//          onPressed: () => print("Open")),
//    );
//  }
//}
