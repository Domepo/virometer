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
          ),
        ));
  }
}
//             padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
