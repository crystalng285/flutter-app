import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/renderNavigationBar.dart';

class NewGroup extends StatefulWidget {
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
//  List<ChatModel> _chaters;
//  final String url = "http://5cd46056b231210014e3d893.mockapi.io/api/v1/users";
//  @override
//  void initState() {
//    super.initState();
//    _chaters = [];
//    // API
//    getJsonData();
//  }
//
//  void getJsonData() async {
//    var response = await HTTP.get(Uri.encodeFull(url), headers: {
//      "Accept": "application/json"
//    }); // using method get without body
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
//
//    List data = json.decode(response.body); // [ {} ]
//
//    // parser
//    data.forEach((item) {
//      ChatModel chatmodel = ChatModel.fromJson(item);
//      _chaters.add(chatmodel);
//    });
//
//    this.setState(() {});
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello new group'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30.0, // ban kinh circle avatar
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 25.0,
                          color: Colors.white70,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Upload",
                    style: TextStyle(
                      fontFamily: "NunitoSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Group Name",
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontFamily: "NunitoSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 100,
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Participants: ",
                          style: TextStyle(
                              color: const Color(0xff404040),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Helvetica",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            "https://media.vanityfair.com/photos/5c992a871c3519239055da53/16:9/w_2560%2Cc_limit/bing-bing-april-2019-embed01.jpg",
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.grey,
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Add Participants")
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: RenderNavigationBar(),
    );
  }
}
