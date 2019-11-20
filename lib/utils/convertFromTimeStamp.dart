import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget converFromTimeStamp(List a, int i) {
  DateTime todayDate =
  DateTime.fromMillisecondsSinceEpoch(a[i].time * 1000); //datetime
//var dateformat = DateFormat("dd-MM-yyyy hh:mm a");
  var dateformat = DateFormat("hh:mm a");
  //print(dateformat.format(todayDate));
  return Text(
    dateformat.format(todayDate),
    style: const TextStyle(
        color: const Color(0xff97a1a4),
        fontWeight: FontWeight.w700,
        fontFamily: "NunitoSans",
        fontStyle: FontStyle.normal,
        fontSize: 10.0),
  );
}