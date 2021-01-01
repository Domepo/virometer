import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
import 'package:dio/dio.dart';
import 'package:virometer/modules/countrys/germany/corona_request.dart';
import 'package:virometer/modules/countrys/germany/services.dart';
import 'dart:convert';

class ViroApp extends StatefulWidget {
  @override
  _ViroAppState createState() => _ViroAppState();
}

class _ViroAppState extends State<ViroApp> {
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
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: new Scaffold(
            // appBar: HomeAppBar.getAppBar(),
            body: Container(
              child: FutureBuilder<CovidGerStates>(
                future: _covidGerStates,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.features.length,
                        itemBuilder: (context, index) {
                          var ttt = snapshot.data.features[index];
                          return Container(
                              height: 200,
                              child: ListView(
                                children: <Widget>[
                                  SelectBox("Corona", "Deutschland", "3", "33")
                                ],
                              ));
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // ,
            )));
  }
}
