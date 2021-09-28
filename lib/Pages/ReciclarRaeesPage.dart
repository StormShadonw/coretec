import 'package:coretec/Pages/AjustesPage.dart';
import 'package:coretec/Pages/CambiarContrase%C3%B1aPage.dart';
import 'package:coretec/Pages/ContactanosPage.dart';
import 'package:coretec/Pages/EditarMiNombrePage.dart';
import 'package:coretec/Pages/EditarMiNumeroPage.dart';
import 'package:coretec/Pages/HistorialReciclajePage.dart';
import 'package:coretec/Pages/HomePage.dart';
import 'package:coretec/Pages/ListarReciclajesPage.dart';
import 'package:coretec/Pages/MiPerfilPage.dart';
import 'package:coretec/Pages/NewAccountPage.dart';
import 'package:coretec/Pages/PlantasTratamientoPage.dart';
import 'package:coretec/Pages/PorqueReciclarRaeePage.dart';
import 'package:coretec/Pages/QueSonLasRaeePage.dart';
import 'package:coretec/Pages/QuienesSomosPage.dart';
import 'package:coretec/Widgets/AddNewModal.dart';
import 'package:coretec/Widgets/Drawer.dart';
import 'package:coretec/Widgets/cartWidget.dart';
import 'package:flutter/material.dart';

class ReciclarRaeesPage extends StatelessWidget {
  static const routeName = "/ReciclarRaeesPage";
  var _navigatorKey = GlobalKey<NavigatorState>();
  var objectsToReciclate = [
    "Camara de Vigilancia",
    "Camara Fotografica",
    "Cargador USB",
    "Celular",
    "Consola de Videojuego",
    "Control Remoto",
    "CPU",
    "Disco Duro",
    "Fuente de Poder",
    "Hervidor Electrico",
    "Impresora",
    "Ipad-Tablet",
    "Juguete Electronico",
    "Laptop",
    "Lavadora",
    "Licuadora",
    "Microondas",
    "Monitor",
    "Mouse",
    "Plancha",
    "Proyector",
    "Radio",
    "Reproductor DVD",
    "Reproductor MP3 MP4",
    "Reproductor VHS",
    "Router - Modem",
    "Scanner",
    "Tarjeta Electronica",
    "Teclado",
    "Telefono",
    "Televisor - Smart TV",
    "Unidad de CD",
    "Ventilador",
  ]..sort();

  Widget gridChild(
      String label, String image, Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddNewModal(
                itemType: label,
              );
            });
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 253, 255, 253),
              width: size.width * 0.45,
              height: size.height * 0.20,
              padding: const EdgeInsets.all(25),
              child: Image.asset(
                image,
                width: size.width * 0.15,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.45,
              height: size.height * 0.15,
              color: Color.fromARGB(255, 73, 175, 77),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        print("Navigator: ${_navigatorKey.currentState!.widget.pages}");

        Navigator.pushNamedAndRemoveUntil(
            context, ReciclarRaeesPage.routeName, (route) => false);
        print("Hello");
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Navigator(
        key: _navigatorKey,
        onPopPage: (route, context) {
          return true;
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/ListarReciclajesPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => ListarReciclajesPage()); // Pass it to BarPage.
          }
          if (settings.name == '/NewAccountPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => NewAccountPage()); // Pass it to BarPage.
          }
          if (settings.name == '/ReciclarRaeesPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => ReciclarRaeesPage()); // Pass it to BarPage.
          }
          if (settings.name == '/AjustesPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => AjustesPage()); // Pass it to BarPage.
          }
          if (settings.name == '/ContactanosPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => ContactanosPage()); // Pass it to BarPage.
          }
          if (settings.name == '/HistorialReciclajePage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) =>
                    HistorialReciclajePage()); // Pass it to BarPage.
          }
          if (settings.name == '/PlantasTratamientoPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) =>
                    PlantasTratamientoPage()); // Pass it to BarPage.
          }
          if (settings.name == '/PorqueReciclarRaeePage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) =>
                    PorqueReciclarRaeePage()); // Pass it to BarPage.
          }
          if (settings.name == '/QueSonLasRaeePage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => QueSonLasRaeePage()); // Pass it to BarPage.
          }
          if (settings.name == '/QuienesSomosPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => QuienesSomosPage()); // Pass it to BarPage.
          }
          if (settings.name == '/HomePage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => HomePage()); // Pass it to BarPage.
          }
          if (settings.name == '/MiPerfilPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => MiPerfilPage()); // Pass it to BarPage.
          }
          if (settings.name == '/EditarMiNombrePage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => EditarMiNombrePage()); // Pass it to BarPage.
          }
          if (settings.name == '/EditarMiNumeroPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => EditarMiNumeroPage()); // Pass it to BarPage.
          }
          if (settings.name == '/CambiarContrasenaPage') {
            // final value = settings.arguments as int; // Retrieve the value.
            return MaterialPageRoute(
                builder: (_) => CambiarContrasenaPage()); // Pass it to BarPage.
          }

          return null; // Let `onUnknownRoute` handle this behavior.
        },
        pages: [
          MaterialPage(
            child: Scaffold(
              drawer: DrawerWidget(),
              appBar: AppBar(
                actions: [
                  CartWidget(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ],
                title: Text("CORETEC"),
              ),
              body: Container(
                padding: const EdgeInsets.only(top: 15),
                color: Color.fromARGB(255, 235, 238, 235),
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 5,
                    // mainAxisSpacing: 5,
                    childAspectRatio: 2 / 3,
                    children: [
                      ...objectsToReciclate.map((e) {
                        return gridChild(
                            e, "Assets/Images/$e.png", size, context);
                      }).toList(),
                    ],
                  ),
                ),
                width: size.width,
                height: size.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
