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
  runApp(ViroApp());
}

class ViroApp extends StatefulWidget {
  @override
  _ViroAppState createState() => _ViroAppState();
}

class _ViroAppState extends State<ViroApp> {
   List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "",
          body: "Danke das du dir die Virometer-App heruntergeladen hast :)",
          footer: Text("Fragen: kann man den Daten trauen?\n Ja klar!Alle Daten sind direkt vom RKI übermittelt und damit vertrauenswürdig"),
           image: Image.asset("assets/images/Virosmeter-App-Icon.png"),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
      PageViewModel(
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home:  Builder(
        builder: (context) => IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        onDone: ()  {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(),
              ), //MaterialPageRoute
            );
          },
        ), //IntroViewsFlutter
      ), //Builder
        );
  }
}
