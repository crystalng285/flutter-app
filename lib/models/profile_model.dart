import 'package:flutter/material.dart';

class ProfileModel {
  //Variable
  Icon icon;
  final String title;


  //Constructor
  ProfileModel({
    this.icon, this.title
  });

}

  List<ProfileModel> profilemenu = [

    ProfileModel(
      icon: Icon(Icons.account_circle, size: 40.0),
      title: 'Account',
    ),
    ProfileModel(
      icon: Icon(Icons.chat_bubble_outline, size: 40.0),
      title: 'Chats',
    ),
    ProfileModel(
      icon: Icon(Icons.notifications, size: 40.0),
      title: 'Notification',
    ),
    ProfileModel(
      icon: Icon(Icons.info, size: 40.0),
      title: 'Application Info',
    ),
    ProfileModel(
      icon: Icon(Icons.help, size: 40.0),
      title: 'Help Center',
    ),
    ProfileModel(
      icon: Icon(Icons.subdirectory_arrow_right, size: 40.0),
      title: 'Logout',
    ),
  ];
