import 'package:coretec/Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  initFirebase();
  runApp(MyApp());
}

Future<void> initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(76, 175, 80, .1),
      100: Color.fromRGBO(76, 175, 80, .2),
      200: Color.fromRGBO(76, 175, 80, .3),
      300: Color.fromRGBO(76, 175, 80, .4),
      400: Color.fromRGBO(76, 175, 80, .5),
      500: Color.fromRGBO(76, 175, 80, .6),
      600: Color.fromRGBO(76, 175, 80, .7),
      700: Color.fromRGBO(76, 175, 80, .8),
      800: Color.fromRGBO(76, 175, 80, .9),
      900: Color.fromRGBO(76, 175, 80, 1),
    };

    MaterialColor colorCustom = MaterialColor(0xFF4caf50, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: HomePage(),
    );
  }
}
