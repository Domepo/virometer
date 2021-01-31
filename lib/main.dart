import 'dart:io';
import 'package:flutter/material.dart';
import 'screens/viro_home/homescreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  // Hive.registerAdapter(StatesCheckAdapter());
  Hive.init(document.path);
  // await Hive.openBox("states_checked");
  await Hive.openBox("district_checked");
  await Hive.openBox("info_screen");
  runApp(ViroApp());
}

class ViroApp extends StatefulWidget {
  @override
  _ViroAppState createState() => _ViroAppState();
}

class _ViroAppState extends State<ViroApp> {
  Box box;
  void initState() {
    Hive.openBox("info_screen");
    box = Hive.box("info_screen");
    super.initState();
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "",
          body: "Danke, dass du dir die Virometer-App heruntergeladen hast :)",
          // footer: Text("Fragen: kann man den Daten trauen?\n Ja klar!Alle Daten sind direkt vom RKI übermittelt und damit vertrauenswürdig"),
          image: Image.asset("assets/images/IntroVirometer.jpg"),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
      PageViewModel(
        image: Image.asset("assets/images/Anleitung.jpg"),
        title: "Anleitung",
        body:
            " Wenn du auf den blauen Knopf drückst, kannst du verschiedene Landkreise hinzufügen. Die Zahl in der Mitte gibt die 7-Tage-Inzidenz an und färbt sich rot, wenn sie 200 überschreitet. Die Fälle und Tode beziehen sich auf die Gesamtanzahl (seit Aufzeichnung) \n Kann man diesen daten überhaupt trauen?Ja Klar! Alle Daten werden direkt vom Robert-Koch-Institut abgegriffen und im 24-Stunden Rhythmus aktualisiert. \n \n Wichtig:\n Bei der Suchfunktion bitte auf Groß- und Kleinschreibung und auf Umlaute achten.",
        footer: Text("Die Suchfunktion wird beim nächsten Update überarbeitet"),
      ),
      PageViewModel(
        image: Image.asset("assets/images/Verordnung.jpg"),
        title: "Corona-Verordnung",
        body:
            "Alle bis zum 10.Januar befristeten Maßnahmen werden bis zum 31.Januar 2021 verlängert - auch die Einschränkung des Schulbetriebs und der Kindertagesstätten\n \nPrivate Zusammenkünfte sind im Kreis der Angehörigen des eigenen Hausstandes und mit max. EINER weitern nicht im Haushalt lebenden Person gestattet. \n \n Für Landkreise mit einer 7-Tages-Inzidenz über 200 soll der Bewegungsradius auf 15 Kilometer um den Wohnort eingeschränkt werden, sofern kein triftiger Grund vorliegt.",
        footer: Text("Quelle: Bundesregieung.de"),
      ),
      PageViewModel(
        image: Image.asset("assets/images/DSGVO.jpg"),
        title: "DSGVO und Kontakt",
        body:
            "Falls du mich kontaktieren willst, kannst du mir gerne eine Mail an virometerapp@gmail.com schicken \n \n Hier der DSGVO Kram:\nhttps://github.com/Domepo/virometer/blob/main/.github/txt/VirometerDSGVO.md",
        footer: Text("Virometer"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // If condition to display the infoscreen only one time
    // 
    if(box.get("infoscreen")==null){
      return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Builder(
        builder: (context) => IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: getPages(),
          showNextButton: true,
          showSkipButton: true,
          skip: Text("Weiter"),
          done: Text("Verstanden"),
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(),

              ), //MaterialPageRoute
            );
            box.put("infoscreen", true);
          },
        ), //IntroViewsFlutter
      ), //Builder
    );
    }else{
      return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: FirstPage());
    }

    }

  
}
