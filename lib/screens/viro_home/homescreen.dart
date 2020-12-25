import 'package:flutter/material.dart';
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
class ViroApp extends StatelessWidget {
  final selectVirusBox = SelectBox.getSelectBox();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: Scaffold(
          appBar: HomeAppBar.getAppBar(),
          body:ListView(
          children: [
            selectVirusBox,selectVirusBox,selectVirusBox,selectVirusBox,selectVirusBox,selectVirusBox,selectVirusBox,selectVirusBox,
          ],
        )
        ));
  }
}
//             padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
