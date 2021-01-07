import '../viro_home/homescreen_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virometer/modules/countrys/germany/corona_district_class_api_fetch.dart';
import 'dart:convert';
import 'package:latinize/latinize.dart';
import 'package:virometer/screens/covid_germany/select_boxes/select_box_districts.dart';
import 'package:hive/hive.dart';

class Districts extends StatefulWidget {
  @override
  _DistrictsState createState() => _DistrictsState();
}

class _DistrictsState extends State<Districts> {
    Box box;

  TextEditingController editingController = TextEditingController();

  Future<CovidGerDistricts> getData() async {
    var client = http.Client();
    var covidDistrictGerModel = null;

    var response = await client.get(
        "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=*&returnGeometry=false&outSR=4326&f=json");
    try {
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var repsonseBodyMap = json.decode(responseBody);
        covidDistrictGerModel = CovidGerDistricts.fromJson(repsonseBodyMap);
        return covidDistrictGerModel;
      }
    } catch (Exception) {
      return covidDistrictGerModel;
    }
    return covidDistrictGerModel;
    //    print(userMap["features"][0]["attributes"]["deaths"]);
  }

  Future<CovidGerDistricts> _covidDistrictGerModel;
  @override
  void initState() {
    _covidDistrictGerModel = getData();
    box = Hive.box("district_checked");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),
          Expanded(
            child: FutureBuilder<CovidGerDistricts>(
              future: _covidDistrictGerModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.features.length,
                      itemBuilder: (context, index) {
                        var covidAtrbs = snapshot.data.features[index];
                        // print(latinize(covidAtrbs.attributes.lanEwGen.toString()) );
                        return SelectBoxDistrcts(
                            latinize(covidAtrbs.attributes.county.toString()));
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ])));
  }
}
