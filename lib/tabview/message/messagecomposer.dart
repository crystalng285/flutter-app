import 'package:flutter/material.dart';


class MessageComposer extends StatefulWidget {
  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  _buildMessageComposer() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 150,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.insert_emoticon),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_voice),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) {},
                    decoration: InputDecoration.collapsed(
                      hintText: 'Write Message',
                        //border: InputBorder.none
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        )

    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildMessageComposer(),
    );
  }
}
