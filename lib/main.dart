import 'dart:io';

import 'package:flutter/material.dart';
import 'screens/viro_home/homescreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox("states_checked");
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
