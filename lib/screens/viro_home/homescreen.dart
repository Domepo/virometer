import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latinize/latinize.dart';
import 'package:virometer/modules/countrys/germany/corona_district_class_api_fetch.dart';
import 'package:virometer/screens/covid_germany/districts.dart';
import 'homescreen_appbar.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'dart:async';
import 'package:introduction_screen/introduction_screen.dart';

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
    Hive.openBox("district_checked");
    box = Hive.box("district_checked");
    super.initState();
  }

  Future<CovidGerDistricts> getData() async {
    var client = http.Client();
    var covidStateGerModel = null;

    var response = await client.get(
        "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=*&returnGeometry=false&outSR=4326&f=json");
    try {
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var repsonseBodyMap = json.decode(responseBody);
        covidStateGerModel = CovidGerDistricts.fromJson(repsonseBodyMap);
        // print(repsonseBodyMap);
        return covidStateGerModel;
      }
    } catch (Exception) {
      return covidStateGerModel;
    }
    return covidStateGerModel;
    //  print(userMap["features"][0]["attributes"]["deaths"]);
  }

  Future<CovidGerDistricts> _covidStateGerStates;

  @override
  Widget build(BuildContext context) {
    print(box.keys);
    var inzidenzColor;
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),

        body: Stack(
          children: <Widget>[ 
            FutureBuilder<CovidGerDistricts>(
              future: _covidStateGerStates,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.features.length,
                      itemBuilder: (context, index) {
                        var covidAtrbs = snapshot.data.features[index];

                        var covidAtrbsIndex = covidAtrbs.attributes;
                        if (box.get(latinize(covidAtrbsIndex.county)) == true) {
                          var _virusTitle =
                              covidAtrbs.attributes.county.toString();
                          var _virusRegion =
                              covidAtrbs.attributes.cases7Per100KTxt.toString();
                          var _virusCases =
                              covidAtrbs.attributes.cases.toString();
                          var _virusDeaths =
                              covidAtrbs.attributes.deaths.toString();

                          if (covidAtrbs.attributes.cases7Per100K > 200) {
                            inzidenzColor = 0xfff52020;
                          } else {
                            inzidenzColor = 0xff2e9c27;
                          }
                          return Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),

                              // height: 155 * i,
                              height: 125,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 10),
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
                                            fontSize: 14,
                                            color: Color(inzidenzColor)))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
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
                                  mainAxisSize: MainAxisSize.max,
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
            Positioned(
              bottom: 15,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                          MaterialPageRoute(builder: (context) => Districts()))
                      .then((value) => setState(() {}));
                },
                child: Icon(Icons.add),
              ),
              // Align(
              //     alignment: Alignment.center,
              //     child: new GestureDetector(
              //       onTap: () {
              //         Navigator.of(context)
              //             .push(MaterialPageRoute(
              //                 builder: (context) => SelectCountryPage()))
              //             .then((value) => setState(() {}));
              //         ;
              //       },
              //       child: new Text("Füge eine Region hinzu",
              //           style: TextStyle(
              //               fontSize: 13, color: Color(0xff6E6E6E))),
              //     ))
            ),
          ],
        ));
  }
}
