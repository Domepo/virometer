import 'package:latinize/latinize.dart';
import 'package:virometer/modules/countrys/germany/corona_state_class_api_fetch.dart';
import 'package:virometer/screens/covid_germany/select_boxes/select_box_states.dart';
import '../viro_home/homescreen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  Future<CovidStateGermany> getData() async {
    var client = http.Client();
    var covidStateGerModel;

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
  @override
  void initState() {
    _covidStateGerStates = getData();
    super.initState();
  }

  // void a() async {
  //   var box = await Hive.openBox('testBox');
  //   box.put('name', 'David');
  //   print('Name: ${box.get('name')}');
  // }

  @override
  Widget build(BuildContext context) {
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
                      // print(latinize(covidAtrbs.attributes.lanEwGen.toString()) );
                      return SelectBoxStates(
                        // 
                        // 
                        // latininize = remove germany umlauts
                        // Ä = AE
                        // 
                        // 
                         latinize(covidAtrbs.attributes.lanEwGen.toString()) );
                        
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}