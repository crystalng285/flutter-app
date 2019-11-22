import 'package:flutter/material.dart';
import 'package:flutter_chat/models/menuitem.dart';
import 'package:flutter_chat/modules/home/pages/home_page.dart';
import 'package:flutter_chat/modules/friend/pages/friendpage.dart';
import 'package:flutter_chat/modules/message/pages/message_page.dart';
import 'package:flutter_chat/modules/profile/pages/profilepage.dart';
import 'package:flutter_chat/modules/story/pages/storypage.dart';

class RenderNavigationBar extends StatefulWidget {
  @override
  _RenderNavigationBarState createState() => _RenderNavigationBarState();
}

class _RenderNavigationBarState extends State<RenderNavigationBar> {
  int _selectedPage;

  List<MenuItem> _menu;

  Widget _renderBottomNavigationBar() {
    List<BottomNavigationBarItem> _bottomnavigationbaritems;

    _bottomnavigationbaritems = _menu.map((menuItem) {
      return menuItem.item;
    }).toList();

    return BottomNavigationBar(
      items: _bottomnavigationbaritems,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedPage,
    );
  }

  void _changeIndexPage(int newIndex) {
    if (_selectedPage == newIndex) {
      return;
    }

    this.setState(() {
      _selectedPage = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    _selectedPage = 1;
    _menu = [
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.home), onPressed: () => _changeIndexPage(0)),
          title: Container(),
        ),
        widget: HomePage(),
        appbarTitle: "Flutter",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.chat_bubble_outline),
              onPressed: () => _changeIndexPage(1)),
          title: Container(),
        ),
        widget: MessagePage(),
        appbarTitle: "Chat",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => _changeIndexPage(2)),
          title: Container(),
        ),
        widget: StoryPage(),
        appbarTitle: "Story",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.people), onPressed: () => _changeIndexPage(3)),
          title: Container(),
        ),
        widget: FriendPage(),
        appbarTitle: "Friends",
      ),
      MenuItem(
        item: BottomNavigationBarItem(
          icon: IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () => _changeIndexPage(4)),
          title: Container(),
        ),
        widget: ProfilePage(),
        appbarTitle: "Profile",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _renderBottomNavigationBar());
  }
}
