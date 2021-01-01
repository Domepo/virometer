import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virometer/modules/countrys/germany/corona_request.dart';
import 'package:http/http.dart' as http;
import '../homescreen.dart';

class SelectBox extends StatelessWidget {
  final String _virusTitle;
  final String _virusRegion;
  final String _virusCases;
  final String _virusDeaths;

  SelectBox(
      this._virusTitle, this._virusRegion, this._virusCases, this._virusDeaths);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        height: 195,
        // height: 155, without nav button
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 10),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18)),
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
              child: Text(_virusTitle,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff3A0CA3),
                      fontWeight: FontWeight.w600))),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 0.2,
            indent: 0,
            endIndent: 0,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(_virusRegion,
                  style: TextStyle(fontSize: 13, color: Color(0xff6E6E6E)))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_virusCases,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3A0CA3),
                      fontWeight: FontWeight.bold)),
              Text(_virusDeaths,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3A0CA3),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Fälle",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff3A0CA3),
                  )),
              Text("Tode",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff3A0CA3),
                  )),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 0.2,
            indent: 0,
            endIndent: 0,
          ),
          Align(
              alignment: Alignment.center,
              child: Text("Füge eine Region hinzu",
                  style: TextStyle(fontSize: 13, color: Color(0xff6E6E6E)))),
          Column(children:[
      
            RaisedButton(
              child: Text("geh zu 2"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
        ]),new GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, "");
  },
  child: new Text("my Title"),
)
        ]));
  }
}
// child: RaisedButton(
//   child: Text("geh zu 2"),
//   onPressed: () {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => SecondPage())
//     );
//   },
// ),
