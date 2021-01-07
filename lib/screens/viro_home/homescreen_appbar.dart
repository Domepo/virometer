import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class HomeAppBar {
  static getAppBar() {
    // 
    // change timezone
    // print(new DateFormat.Hm("de_DE").format(new DateTime.now()))
    // 
    // https://api.flutter.dev/flutter/intl/DateFormat-class.html
    // 
    initializeDateFormatting();
    var dateGER = (new DateFormat.EEEE("de_DE").format(new DateTime.now()) +
        " " +
        new DateFormat.d("de_DE").format(new DateTime.now()) +
        ". " +
        new DateFormat.LLLL("de_DE").format(new DateTime.now()));
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Column(children: [
        Text(
          "Virometer",
          style: TextStyle(color: Color(0xff3A0CA3), fontSize: 23),
        ),
        Text(dateGER.toString(),
            style: TextStyle(color: Color(0xff6E6E6E), fontSize: 10)),
      ]),
    );
  }
}
