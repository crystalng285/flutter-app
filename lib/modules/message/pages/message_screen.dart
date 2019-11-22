import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:flutter_chat/models/conversation_model.dart';
import 'package:flutter_chat/tabview/message/messagecomposer.dart';

class messageScreen extends StatefulWidget {
  @override
  _messageScreenState createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  final topBar = AppBar(
    iconTheme: IconThemeData(color: Colors.teal),
    backgroundColor: Colors.white, // cua Appbar
    centerTitle: false,
    // get the title text centered perfectly between the 2 icons
    elevation: 7.0, // do cao, mo` mo` cua app bar
    leading: BackButton(color: Colors.grey,),
    //hang dau
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              sender.name,
              style: TextStyle(
                  color: const Color(0xff404040),
                  fontWeight: FontWeight.w700,
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
          ],
        ),

        Row(
          children: <Widget>[
            Icon(
              Icons.arrow_drop_down_circle,
              size: 15.0,
              color: Colors.lightGreen,
            ),
            SizedBox(width: 6,),
            Text(
              'Active now', style: TextStyle(
                color: const Color(0xff404040),
                fontWeight: FontWeight.w700,
                fontFamily: "NunitoSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            )
          ],
        )

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
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );

  Widget renderAvatar(ChatModel a) {
    return Container(
        width: 45,
        height: 45,
        child: CircleAvatar(
            radius: 30, backgroundImage: NetworkImage(a.avatarUrl)));
  }

  _buildMessage(ConversationModel message, bool isMe) {
    return Column(
      children: <Widget>[
        isMe
//        //grey
            ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  right: 10,
                  child: CustomPaint(
                    painter: Triangle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  margin: EdgeInsets.only(
                    top: 10.0,
                    bottom: 50.0,
                    right: 10,
                    //left: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
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
              ],
            ),
            renderAvatar(sender),
          ],
        )

        //teal Hello kitty
            : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            renderAvatar(currentUser),
            Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: CustomPaint(
                    painter: Triangle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  margin: EdgeInsets.only(
                    top: 10.0,
                    bottom: 50.0,
                    right: 3.0,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.only(
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
              ],
            ),
//                  Container(
//                    child: CustomPaint(
//                      painter: Triangle(),
//                    ),
//                  ),
//                  Container(
//                    padding:
//                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
//                    width: MediaQuery.of(context).size.width * 0.75,
//                    margin: EdgeInsets.only(
//                      top: 10.0,
//                      bottom: 50.0,
//                      right: 3.0,
//                      left: 10,
//                    ),
//                    decoration: BoxDecoration(
//                      color: Colors.tealAccent,
//                      borderRadius: BorderRadius.only(
//                        topRight: Radius.circular(15.0),
//                        bottomRight: Radius.circular(15.0),
//                      ),
//                    ),
//                    child: Text(
//                      message.text,
//                      style: TextStyle(
//                          color: isMe ? Colors.white : Color(0xff404040),
//                          fontWeight: FontWeight.w600,
//                          fontFamily: "NunitoSans",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 14.0),
//                    ),
//                  ),
          ],
        ),
//        Container(
        //khoang cach giua text va khung
//          margin: isMe
//              //grey
//              ? EdgeInsets.only(
//                  top: 10.0,
//                  bottom: 50.0,
//                  right: 50,
//                  left: 10.0,
//                )
//              //teal
//              : EdgeInsets.only(
//                  top: 10.0,
//                  bottom: 50.0,
//                  right: 3.0,
//                  left: 50,
//                ),
//          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),

        //khung chat
//          width: MediaQuery.of(context).size.width * 0.75,
//          decoration: BoxDecoration(
//            color: isMe ? Colors.grey : Colors.tealAccent,
//            borderRadius: isMe
//                ? BorderRadius.only(
//                    topLeft: Radius.circular(15.0),
//                    bottomLeft: Radius.circular(15.0),
//                  )
//                : BorderRadius.only(
//                    topRight: Radius.circular(15.0),
//                    bottomRight: Radius.circular(15.0),
//                  ),
//          ),
//          child: Text(
//            message.text,
//            style: TextStyle(
//                color: isMe ? Colors.white : Color(0xff404040),
//                fontWeight: FontWeight.w600,
//                fontFamily: "NunitoSans",
//                fontStyle: FontStyle.normal,
//                fontSize: 14.0),
//          ),
        //       ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
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
                  padding: EdgeInsets.all(16.0),
                  //controller: ScrollController,
                  itemCount: conversationData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ConversationModel message = conversationData[index];
                    final bool isMe = message.sender.name == currentUser.name;
                    return _buildMessage(message, isMe);
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: MessageComposer(),
    );
  }
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.tealAccent;

    var path = Path();
    path.lineTo(10, 0);
    path.lineTo(0, -10);
    path.lineTo(-10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
