import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'homescreen_appbar.dart';
import 'select_box/select_box.dart';
import 'package:dio/dio.dart';
import 'package:virometer/modules/countrys/germany/corona_request.dart';
import 'package:virometer/modules/countrys/germany/services.dart';
import 'dart:convert';

class ViroApp extends StatelessWidget {
  void getData() async {
    var response = await Dio().get(
        // "https://api.jsonbin.io/b/5fe7adebd151a57b893871c9");
        "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=cases,deaths,county&returnGeometry=false&outSR=4326&f=json");
    //  print(response.data[0]);
    var responseBody = response.data;
    final welcome = welcomeFromJson(responseBody);
    Map userMap = jsonDecode(responseBody);

    print(userMap["features"][1]["attributes"]["cases"]);

    // final featurea = featureFromJson(responseBody);
    // final attributes = attributesFromJson(responseBody);

    // Wenn man den Vorderen Key weglässt, dann funkt alles
    // Also muss man nur an die welcom.feature.atribute.cases dran kommen
    // Irgendwie geht das nicht
  }

  // void initState(){
  //     Services.getUsers().then((value){
  //       print(value);
  //     });
  // }

  // final selectVirusBox = SelectBox();
  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: Scaffold(
            appBar: HomeAppBar.getAppBar(),
            body: ListView(
              children: [
                SelectBox("Corona", "Deutschland", "3000", "33"),
              ],
            )));
  }
}
