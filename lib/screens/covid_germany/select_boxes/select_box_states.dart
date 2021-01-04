import 'package:flutter/material.dart';

class SelectBoxStates extends StatefulWidget {
  final String _stateName;
  SelectBoxStates(this._stateName);

  @override
  _SelectBoxStatesState createState() => _SelectBoxStatesState();
}

class _SelectBoxStatesState extends State<SelectBoxStates> {
  @override
  bool _isChecked = false;
  Widget build(BuildContext context) {
     return 
    Container(
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
          child:   CheckboxListTile(
                title: Text(widget._stateName,style: TextStyle(fontSize: 25, color: Color(0xff6E6E6E))),
                controlAffinity: ListTileControlAffinity.platform,
                value:_isChecked,
                onChanged: (bool newvalue) {
                  setState(() {
                    _isChecked = newvalue;
                  });
                }),
        ));

  }
}
