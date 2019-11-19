import 'package:flutter/material.dart';
import 'package:flutter_chat/models/conversation_model.dart';
import 'package:flutter_chat/tabview/message/messagecomposer.dart';

class messageScreen extends StatefulWidget {
  @override
  _messageScreenState createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  final topBar = AppBar(
    backgroundColor: Colors.white, // cua Appbar
    centerTitle:
        false, // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: BackButton(), //hang dau
    title: Column(
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: const Color(0xff404040),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
        ),
        Text(
          'Active now',
          style: TextStyle(
              color: const Color(0xff404040),
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              fontStyle: FontStyle.normal,
              fontSize: 10.0),
        ),
      ],
    ),

    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );

  _buildMessage(ConversationModel message, bool isMe) {

    return Row(
      children: <Widget>[
        Container(
          //khoang cach giua text va khung
          margin: isMe
              ? EdgeInsets.only(
                  top: 10.0,
                  bottom: 50.0,
                  right: 50,
                  left: 10.0,
                )
              : EdgeInsets.only(
                  top: 10.0,
                  bottom: 50.0,
                  right: 3.0,
                  left: 50,
                ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),

          //khung chat
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Colors.grey : Colors.tealAccent,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Text(
            message.text,
            style: TextStyle(
                color: isMe ? Colors.white : Color(0xff404040),
                fontWeight: FontWeight.w600,
                fontFamily: "NunitoSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
        isMe
            ?
        Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
                radius: 30,
                backgroundImage:
                   NetworkImage(sender.avatarUrl)
                    ))
            :Container(
    width: 40,
    color: Colors.blue,
    height: 40,
    child: CircleAvatar(
    radius: 30,
    backgroundImage:
    NetworkImage(currentUser.avatarUrl))
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: topBar,
      body: Column(
        children: <Widget>[
          Expanded(
            //make it fit
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: ListView.builder(
                  //reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  itemCount: conversationData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ConversationModel message = conversationData[index];
                    final bool isMe = message.sender.name == currentUser.name;
                    return _buildMessage(message, isMe);
                    // return Text(conversationData[index].text);
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: MessageComposer(),
    );
  }
}
