import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virometer/screens/viro_select/select.dart';
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
import 'package:dio/dio.dart';
import 'package:virometer/modules/countrys/germany/corona_request.dart';
import 'package:virometer/modules/countrys/germany/services.dart';
import 'dart:convert';



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<CovidGerStates> getData() async {
    var client = http.Client();
    var covidGerModel = null;

    var response = await client.get(
        "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=cases,deaths,county&returnGeometry=false&outSR=4326&f=json");
    try {
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var repsonseBodyMap = json.decode(responseBody);
        covidGerModel = CovidGerStates.fromJson(repsonseBodyMap);
        return covidGerModel;
      }
    } catch (Exception) {
      return covidGerModel;
    }
    return covidGerModel;
    //    print(userMap["features"][0]["attributes"]["deaths"]);
  }

  Future<CovidGerStates> _covidGerStates;
  @override
  void initState() {
    _covidGerStates = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: Container(
          child: FutureBuilder<CovidGerStates>(
            future: _covidGerStates,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.features.length,
                    itemBuilder: (context, index) {
                      var covidAtrbs = snapshot.data.features[index];
                      return SelectBox(
                          "Corona",
                          covidAtrbs.attributes.county,
                          covidAtrbs.attributes.cases.toString(),
                          covidAtrbs.attributes.deaths.toString());
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
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: HomeAppBar.getAppBar(),
       body: Container(child: Text("was gehrt av"),),
    );
  }
}