import 'package:flutter/material.dart';
import '../viro_home/homescreen_appbar.dart';
import 'package:virometer/screens/viro_home/select_box/select_box_countries.dart';

class SelectCountryPage extends StatefulWidget {
  @override
  _SelectCountryPageState createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: ListView(children: [
          SelectBoxCountries("Germany"),
          SelectBoxCountries("Russland"),
          SelectBoxCountries("Amerika")
        ]));
  }
}
