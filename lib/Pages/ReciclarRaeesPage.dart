import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Providers/CartProvider.dart';
import 'package:coretec/Widgets/AddNewModal.dart';
import 'package:coretec/Widgets/Drawer.dart';
import 'package:coretec/Widgets/cartWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ReciclarRaeesPage extends StatelessWidget {
  static const routeName = "/ReciclarRaeesPage";
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
    return Scaffold(
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
                return gridChild(e, "Assets/Images/$e.png", size, context);
              }).toList(),
            ],
          ),
        ),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
