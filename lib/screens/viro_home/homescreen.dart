import 'package:flutter/material.dart';
import 'homescreen_appbar.dart';

class ViroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: Scaffold(
          appBar: HomeAppBar.getAppBar(),
          body: Container(
              margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 50),
              height: 150,
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
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 5))
                  ]),
              child: Column(children: [
                Align(
                    alignment: Alignment.center,
                    child: Text("SARS-CoV-2 / Covid-19",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff3A0CA3)))),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 0.5,
                  indent: 0,
                  endIndent: 0,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text("Weltweit",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff6E6E6E)))),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text("77.432.103",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff3A0CA3),
                                fontWeight: FontWeight.bold))),
                    Text("1.704.065",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff3A0CA3),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text("Fälle",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff3A0CA3),
                            ))),
                    Text("Tode",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff3A0CA3),
                        )),
                  ],
                ),
              ])),
        ));
  }
}
//             padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
