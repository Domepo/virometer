import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:virometer/screens/viro_select/select_country.dart';
import '../homescreen.dart';

class SelectBoxCountries extends StatelessWidget {
  final String _countryName;
SelectBoxCountries(
  this._countryName
);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
         height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 10),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 5))
            ]),
        child: Column(children: [
          Align(
              alignment: Alignment.center,
              child: Text(_countryName,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff3A0CA3),
                      fontWeight: FontWeight.w600))
        )]));
  }
}