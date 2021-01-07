import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:latinize/latinize.dart';
import 'package:virometer/states_checked_hivedb.dart';

class SelectBoxDistrcts extends StatefulWidget {
  final String _districtName;
  SelectBoxDistrcts(this._districtName);

  @override
  _SelectBoxDistrctsState createState() => _SelectBoxDistrctsState();
}

class _SelectBoxDistrctsState extends State<SelectBoxDistrcts> {

  bool _isChecked = false;
  Box box;
  void initState(){
    super.initState();
    box = Hive.box("district_checked");
  }
@override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 10),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 5))
            ]),


        //
        // Checkboxes
        //
        child: Center(
          child: CheckboxListTile(
              title: Text(widget._districtName,
                  style: TextStyle(fontSize: 25, color: Color(0xff6E6E6E))),
              controlAffinity: ListTileControlAffinity.platform,
              value:  box.get(widget._districtName),
              onChanged: (bool newvalue) {
                setState(() {
                  box.put(widget._districtName,newvalue);
                });
              }),
        ));
    

    
    // Hive.openBox('states_checked');
    // var box = Hive.box("states_checked");

    // //   @HiveType(typeId: 0)
    // if (box.get(widget._stateName) == null) {
    //   box.put(widget._stateName, _isChecked);
    
     }
}

class Test {
  final String _state;
  final bool _isCheckedBool;
  Test(this._state, this._isCheckedBool);
  void pushData() async {
    var box = await Hive.openBox('states_checked');
    box.put(this._state, this._isCheckedBool);
    print(_state + " ${box.get(_state)}");
  }
}