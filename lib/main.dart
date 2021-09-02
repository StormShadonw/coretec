import 'package:coretec/Pages/AjustesPage.dart';
import 'package:coretec/Pages/ContactanosPage.dart';
import 'package:coretec/Pages/HistorialReciclajePage.dart';
import 'package:coretec/Pages/HomePage.dart';
import 'package:coretec/Pages/LogInPage.dart';
import 'package:coretec/Pages/MiPerfilPage.dart';
import 'package:coretec/Pages/NewAccountPage.dart';
import 'package:coretec/Pages/PlantasTratamientoPage.dart';
import 'package:coretec/Pages/PorqueReciclarRaeePage.dart';
import 'package:coretec/Pages/QueSonLasRaeePage.dart';
import 'package:coretec/Pages/QuienesSomosPage.dart';
import 'package:coretec/Pages/ReciclarRaeesPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  await initFirebase();
  runApp(MyApp());
}

Future<void> initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        routes: {
          NewAccountPage.routeName: (ctx) => NewAccountPage(),
          LoginPage.routeName: (ctx) => LoginPage(),
          ReciclarRaeesPage.routeName: (ctx) => ReciclarRaeesPage(),
          AjustesPage.routeName: (ctx) => AjustesPage(),
          ContactanosPage.routeName: (ctx) => ContactanosPage(),
          HistorialReciclajePage.routeName: (ctx) => HistorialReciclajePage(),
          PlantasTratamientoPage.routeName: (ctx) => PlantasTratamientoPage(),
          PorqueReciclarRaeePage.routeName: (ctx) => PorqueReciclarRaeePage(),
          QueSonLasRaeePage.routeName: (ctx) => QueSonLasRaeePage(),
          QuienesSomosPage.routeName: (ctx) => QuienesSomosPage(),
          HomePage.routeName: (ctx) => HomePage(),
          MiPerfilPage.routeName: (ctx) => MiPerfilPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        home: HomePage(),
      ),
    );
  }
}
