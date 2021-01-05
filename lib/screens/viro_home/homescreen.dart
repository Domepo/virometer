import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latinize/latinize.dart';
import 'package:virometer/modules/countrys/germany/corona_state_class_api_fetch.dart';
import 'package:virometer/screens/viro_select/select_country.dart';
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
import 'package:hive/hive.dart';
import 'package:virometer/modules/countrys/germany/corona_district_class_api_fetch.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Box box;

  Future<CovidStateGermany> getData() async {
    var client = http.Client();
    var covidStateGerModel = null;

    var response = await client.get(
        "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/Coronaf%C3%A4lle_in_den_Bundesl%C3%A4ndern/FeatureServer/0/query?where=1%3D1&outFields=*&returnGeometry=false&outSR=4326&f=json");
    try {
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var repsonseBodyMap = json.decode(responseBody);
        covidStateGerModel = CovidStateGermany.fromJson(repsonseBodyMap);
        return covidStateGerModel;
      }
    } catch (Exception) {
      return covidStateGerModel;
    }
    return covidStateGerModel;
    //    print(userMap["features"][0]["attributes"]["deaths"]);
  }

  Future<CovidStateGermany> _covidStateGerStates;

addStringToSF(a) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('stringValue', a);
}

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('stringValue');
  print( stringValue);
}
  void initState() {
    _covidStateGerStates = getData();
    // Hive.openBox("states_checked");
    box = Hive.box("states_checked");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addStringToSF("asddd");
    getStringValuesSF();
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: Container(
          child: FutureBuilder<CovidStateGermany>(
            future: _covidStateGerStates,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.features.length,
                    itemBuilder: (context, index) {
                      var covidAtrbs = snapshot.data.features[index];
                     
    
                      return SelectBox(
                          "Corona",
                          covidAtrbs.attributes.lanEwGen.toString(),
                          covidAtrbs.attributes.fallzahl.toString(),
                          covidAtrbs.attributes.death.toString());
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          // SelectBox("Corona", "Deutschland", "3", "33")
        ));
  }
}
