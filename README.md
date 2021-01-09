# Virometer

Compare viruses and see their behaviour

# RKI API conf

https://npgeo-corona-npgeo-de.hub.arcgis.com/datasets/917fc37a709542548cc3be077a786c17_0/geoservice?geometry=-25.531%2C46.211%2C47.550%2C55.839

# RKI API

https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=cases,deaths,county&returnGeometry=false&outSR=4326&f=json
# Navigator 
https://github.com/flutter/flutter/issues/36530
https://github.com/aagarwal1012/IntroViews-Flutter/blob/master/example/lib/main.dart
```javascript
e.g
          // Column(children: [
          // RaisedButton(
          //   child: Text("geh zu 2"),
          //   onPressed: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => SecondPage()));
          //   },
          // ),
          // ]),
```

# Latinize

*\virometer\lib\screens\covid_germany\states.dart*
changed german umlauts to latin

# To-Do

watch some hive-tutorials  
**Box not found. Did you forget to call Hive.openBox()?**

# Initalize the .g.dart
First of all register the Object to the main.dart file
  ```dart
 Hive.registerAdapter(MyObjectAdapter());
 ```
 then run this in the terminal.
 ```bash
 flutter packages pub run build_runner build
 ```
# Hive test
   ```dart
     print("Schleswig-Holstein "+box.get("Schleswig-Holstein").toString());
     print("Hamburg "+box.get("Hamburg").toString());
     print("Niedersachsen "+box.get("Niedersachsen").toString());
     print("Bremen "+box.get("Bremen").toString());
     print("Nordrhein-Westfalen "+box.get("Nordrhein-Westfalen").toString());
     print("Hessen "+box.get("Hessen").toString());
     print("Rheinland-Pfalz "+box.get("Rheinland-Pfalz").toString());
     print("Baden-Wuerttemberg "+box.get("Baden-Wurttemberg").toString());
     print("Bayern "+box.get("Bayern").toString());
     print("Saarland "+box.get("Saarland").toString());
     print("Brandenburg "+box.get("Brandenburg").toString());
     print("Mecklenburg-Vorpommern "+box.get("Mecklenburg-Vorpommern").toString());
     print("Sachsen "+box.get("Sachsen").toString());
     print("Sachsen-Anhalt "+box.get("Sachsen-Anhalt").toString());
     print("Thüringen "+box.get("Thuringen").toString());
 ```
# Structure for later operations
```Dart
Scaffold(body: ListView(children: [
  Container(
   //box margin height etc
   child: Column(
     children:[
       Align(
          // title
       ),
       Expanded(
         child: FutureBuilder...
       ),
       Divider(

       ),
       Align(

       ),
       Container(
         //repeat Container 1
       )
     ]
   )
)]))
```
``` Dart
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: Container(
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
        ));
  }
}
```