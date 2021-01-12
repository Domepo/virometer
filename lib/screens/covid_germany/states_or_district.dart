import 'package:flutter/material.dart';
import 'package:virometer/screens/covid_germany/select_boxes/select_box_states_or_district.dart';
import '../viro_home/homescreen_appbar.dart';

class SelectStateOrDistrictGERPage extends StatefulWidget {
  @override
  _SelectStateOrDistrictGERPageState createState() =>
      _SelectStateOrDistrictGERPageState();
}

class _SelectStateOrDistrictGERPageState
    extends State<SelectStateOrDistrictGERPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: ListView(children: [
          SelectBoxStatesOrDistricts("Bundesland"),
          SelectBoxStatesOrDistricts("Landkreis")
        ]));
  }
}
// Box nach select_boy:states:or:di auslagern
// weiter machen du rind
