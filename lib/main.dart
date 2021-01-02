import 'package:flutter/material.dart';
import 'screens/viro_home/homescreen.dart';
void main() {
  runApp(ViroApp());
}
class ViroApp extends StatefulWidget {
  @override
  _ViroAppState createState() => _ViroAppState();
}

class _ViroAppState extends State<ViroApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'), home: FirstPage());
        
  }
}