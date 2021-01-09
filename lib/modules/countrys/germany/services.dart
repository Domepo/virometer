// //

// import 'package:http/http.dart' as http;
// import 'corona_request.dart';

// class Services {
//   //
//   static const String url = 'https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?where=1%3D1&outFields=cases,deaths,county&returnGeometry=false&outSR=4326&f=json';
 
//   static Future<List<Welcome>> getUsers() async {
//     try {
//       final response = await http.get(url);
//       if (200 == response.statusCode) {
//         final List<Welcome> users = welcomeFromJson(response.body) as List<Welcome>;
//         return users;
//       } else {
//         return List<Welcome>();
//       }
//     } catch (e) {
//       return List<Welcome>();
//     }
//   }
// }
