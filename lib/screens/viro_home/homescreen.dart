import 'package:flutter/material.dart';

class ViroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
              
              
              
              ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Virometer',
            style: TextStyle(color: Color(0xff3A0CA3), fontSize: 25),
          ),
          bottom: PreferredSize(
              child: Text("Dienstag 22. Dezember",
                  style: TextStyle(color: Color(0xff6E6E6E), fontSize: 10)),
              preferredSize: Size.fromHeight(-15)),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
//             padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
