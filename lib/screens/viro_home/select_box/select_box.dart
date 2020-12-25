import 'package:flutter/material.dart';

class SelectBox {
  static getSelectBox() {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        height: 155,
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
              child: Text("SARS-CoV-2 / Covid-19",
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
              child: Text("Weltweit",
                  style: TextStyle(fontSize: 13, color: Color(0xff6E6E6E)))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("77.432.103",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3A0CA3),
                      fontWeight: FontWeight.bold)),
              Text("1.704.065",
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
        ]));
  }
}
