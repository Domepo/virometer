import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latinize/latinize.dart';
import 'package:virometer/modules/countrys/germany/corona_district_class_api_fetch.dart';
import 'package:virometer/modules/countrys/germany/corona_state_class_api_fetch.dart';
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'dart:async';
import 'package:virometer/states_checked_hivedb.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Box box;
List filter = [];


  void initState() {
     _covidStateGerStates = getData();
    Hive.openBox("states_checked");
    box = Hive.box("states_checked");
    super.initState();
  }



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
        print(repsonseBodyMap);
        return covidStateGerModel;
      }
    } catch (Exception) {
      return covidStateGerModel;
    }
    return covidStateGerModel;
    //  print(userMap["features"][0]["attributes"]["deaths"]);
  }

  Future<CovidStateGermany> _covidStateGerStates;

  @override
  Widget build(BuildContext context) {
    // print("Schleswig-Holstein "+box.get("Schleswig-Holstein").toString());
    // print("Hamburg "+box.get("Hamburg").toString());
    // print("Niedersachsen "+box.get("Niedersachsen").toString());
    // print("Bremen "+box.get("Bremen").toString());
    // print("Nordrhein-Westfalen "+box.get("Nordrhein-Westfalen").toString());
    // print("Hessen "+box.get("Hessen").toString());
    // print("Rheinland-Pfalz "+box.get("Rheinland-Pfalz").toString());
    // print("Baden-Wuerttemberg "+box.get("Baden-Wurttemberg").toString());
    // print("Bayern "+box.get("Bayern").toString());
    // print("Saarland "+box.get("Saarland").toString());
    // print("Brandenburg "+box.get("Brandenburg").toString());
    // print("Mecklenburg-Vorpommern "+box.get("Mecklenburg-Vorpommern").toString());
    // print("Sachsen "+box.get("Sachsen").toString());
    // print("Sachsen-Anhalt "+box.get("Sachsen-Anhalt").toString());
    // print("Thüringen "+box.get("Thuringen").toString());

    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: Container(
          child: FutureBuilder<CovidStateGermany>(
            future: _covidStateGerStates,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.features.length,
                    itemBuilder: (context, index) {
                      var covidAtrbs = snapshot.data.features[index];
                      // print(covidAtrbs.attributes.lanEwGen.toString());
                      // print(covidAtrbs.attributes.lanEwGen);
                      // if (box.get(covidAtrbs.attributes.lanEwGen) == true) {
                      // print(covidAtrbs.attributes.lanEwGen +
                      // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahhh");

                      //}
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
