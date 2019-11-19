import 'package:flutter/material.dart';
import 'package:flutter_chat/modules/home/pages/home_page.dart';
import 'package:flutter_chat/modules/friend/pages/friendpage.dart';
import 'package:flutter_chat/modules/message/pages/message_page.dart';
import 'package:flutter_chat/modules/profile/pages/profilepage.dart';
import 'package:flutter_chat/modules/story/pages/storypage.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int _selectedPage;

  List<MenuItem> _menu;

  Widget _renderAppBar(){
    return AppBar(
      backgroundColor: Colors.teal, // cua Appbar
      //centerTitle: true, // get the title text centered perfectly between the 2 icons
      elevation: 7.0, // do cao, mo` mo` cua app bar
      leading: Icon(Icons.camera_alt), //hang dau
      title: SizedBox(
          height: 35.0,
          child: Text(
            _menu[_selectedPage].appbarTitle,
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

  Widget _renderBody(){
    return _menu[_selectedPage].widget;
  }


  Widget _renderBottomNavigationBar(){
    List<BottomNavigationBarItem> _bottomnavigationbaritems;

    _bottomnavigationbaritems = _menu.map((menuItem){
      return menuItem.item;
    }).toList();


    return BottomNavigationBar(
      items: _bottomnavigationbaritems,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedPage,
    );
  }

  void _changeIndexPage(int newIndex){
    if (_selectedPage == newIndex){
      return;
    }

    this.setState((){
      _selectedPage = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    _selectedPage = 0;
    _menu = [
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.home), onPressed: () => _changeIndexPage(0)),
          title: Container(),
        ),
        widget: HomePage(),
        appbarTitle: "Flutter",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.chat_bubble_outline), onPressed: () => _changeIndexPage(1)),
          title: Container(),
        ),
        widget: MessagePage(),
        appbarTitle: "Chat",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.camera_alt), onPressed: () => _changeIndexPage(2)),
          title: Container(),
        ),
        widget: StoryPage(),
        appbarTitle: "Story",

      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.people), onPressed: () => _changeIndexPage(3)),
          title: Container(),
        ),
        widget: FriendPage(),
        appbarTitle: "Friends",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.person_outline), onPressed: () => _changeIndexPage(4)),
          title: Container(),
        ),
        widget: ProfilePage(),
        appbarTitle: "Profile",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(),
      body: _renderBody(),
      bottomNavigationBar: _renderBottomNavigationBar(),
    );
  }
}

class MenuItem {

  MenuItem({
    this.appbarTitle,
    this.widget,
    this.item,
  });

  final String appbarTitle;
  final BottomNavigationBarItem item;
  final Widget widget;
}
