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
import 'package:virometer/screens/viro_select/select_country.dart';

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
    // für morgen
    // double i = 0;
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
                    itemCount: snapshot.data.features.length,
                    itemBuilder: (context, index) {
                      var covidAtrbs = snapshot.data.features[index];

                      print(covidAtrbs.attributes.lanEwGen);
                      if (box.get(covidAtrbs.attributes.lanEwGen) == true) {
                        // für morgen
                        //  
                        // i = i+1;
                        var _virusTitle = "Corona";
                        var _virusRegion =
                            covidAtrbs.attributes.lanEwGen.toString();
                        var _virusCases =
                            covidAtrbs.attributes.fallzahl.toString();
                        var _virusDeaths =
                            covidAtrbs.attributes.death.toString();
                        return Container(
                            margin: EdgeInsets.only(
                                left: 10, top: 10, right: 10, bottom: 10),

                            // height: 155 * i,
                            height: 155,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    topRight: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(_virusTitle,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff3A0CA3),
                                          fontWeight: FontWeight.w600))),
                              Divider(
                                color: Colors.grey,
                                height: 20,
                                thickness: 0.2,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(_virusRegion,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff6E6E6E)))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(_virusCases,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff3A0CA3),
                                          fontWeight: FontWeight.bold)),
                                  Text(_virusDeaths,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff3A0CA3),
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Fälle",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff3A0CA3),
                                      )),
                                  Text("Tode",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff3A0CA3),
                                      )),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 20,
                                thickness: 0.2,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Align(
                                  //
                                  // NAVIGATION
                                  //
                                  //
                                  alignment: Alignment.center,
                                  child: new GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectCountryPage()))
                                          .then((value) => setState(() {}));
                                      ;
                                    },
                                    child: new Text("Füge eine Region hinzu",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff6E6E6E))),
                                  )),
                            ]));

                       
                      } else {
                       
                        return Column();
                      }
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
