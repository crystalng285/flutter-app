//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_chat/models/chat_model.dart';
//import 'package:flutter_chat/tabview/TabView_message.dart';
//
//
//class searchUsers extends StatefulWidget {
//  @override
//  _searchUsersState createState() => _searchUsersState();
//}
//
//class _searchUsersState extends State<searchUsers> {
//  Future<QuerySnapshot> _users;
//
//  _buildUserTile(ChatModel user, int i) {
//    return ListTile(
//      leading: CircleAvatar(
//        foregroundColor: Theme.of(context).primaryColor,
//        backgroundColor: Colors.grey,
//        backgroundImage:
//        NetworkImage(dummyData[i].avatarUrl),
//      ),
//      title: Text(user.name),
//      onTap: () => Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (_) => MessagePage(
////            userId: user.name,
//          ),
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: _users,
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return Center(
//            //child: CircularProgressIndicator(),
//          );
//        }
//        if (snapshot.data.documents.length == 0) {
//          return Center(
//            child: Text('No users found! Please try again.'),
//          );
//        }
//        return ListView.builder(
//          itemCount: dummyData.length,
//          itemBuilder: (BuildContext context, int index) {
//
//            //ChatModel user = ChatModel.fromDoc(snapshot.data.documents[index]);
//            //ChatModel user = ChatModel.fromDoc(snapshot.data.documents[index]);
//            return _buildUserTile(dummyData[index], index);
//          },
//        );
//      },
//    ) ;
//  }
//}
