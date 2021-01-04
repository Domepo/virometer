import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SelectBoxStates extends StatefulWidget {
  final String _stateName;
  final int _index;
  SelectBoxStates(this._stateName,this._index);

  @override
  _SelectBoxStatesState createState() => _SelectBoxStatesState();
}

class _SelectBoxStatesState extends State<SelectBoxStates> {
  bool _isChecked = false;
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
              title: Text(widget._stateName,
                  style: TextStyle(fontSize: 25, color: Color(0xff6E6E6E))),
              controlAffinity: ListTileControlAffinity.platform,
              value: _isChecked,
              onChanged: (bool newvalue) {
                setState(() {
                  _isChecked = newvalue;
                  Test(widget._stateName, _isChecked).pushData();
                });
              }),
        ));
  }
}

class Test {
  final String _state;
  final bool _isCheckedBool;
  Test(this._state, this._isCheckedBool);
  Future<List> pushData() async {
    var box = await Hive.openBox('states_checked');
    box.put(this._state, this._isCheckedBool);
    print(_state+" ${box.get(_state)}");
    return [_state,box.get(_state)];
  }
}
