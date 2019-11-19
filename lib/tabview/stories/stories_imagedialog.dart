//import 'dart:io';
//import 'package:flutter/cupertino.dart';
//
//import 'package:flutter/material.dart';
//
//class showImageDialog extends StatefulWidget {
//  @override
//  _showImageDialogState createState() => _showImageDialogState();
//}
//
//class _showImageDialogState extends State<showImageDialog> {
//  showSelectImageDialog() {
//    return Platform.isIOS ? _iosBottomSheet() : _androidDialog();
//  }
//
//  //Platform ios
//  _iosBottomSheet() {
//    showCupertinoModalPopup(
//      context: context,
//      builder: (BuildContext context) {
//        return CupertinoActionSheet(
//          title: Text('Add Photo'),
//          actions: <Widget>[
//            CupertinoActionSheetAction(
//              child: Text('Take Photo'),
//              onPressed: () {},
//            ),
//            CupertinoActionSheetAction(
//              child: Text('Choose From Gallery'),
//              onPressed: () {},
//              //onPressed: () => _handleImage(ImageSource.gallery),
//            ),
//          ],
//          cancelButton: CupertinoActionSheetAction(
//            child: Text('Cancel'),
//            onPressed: () => Navigator.pop(context),
//          ),
//        );
//      },
//    );
//    print('ios');
//  }
//
//  //Platform window
//  _androidDialog() {
//    print('android');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.green,
//      child: showSelectImageDialog(),
//    );
//  }
//}
