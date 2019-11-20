import 'package:flutter/material.dart';

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