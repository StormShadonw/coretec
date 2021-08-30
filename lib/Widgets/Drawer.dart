import 'package:coretec/Pages/AjustesPage.dart';
import 'package:coretec/Pages/ContactanosPage.dart';
import 'package:coretec/Pages/HistorialReciclajePage.dart';
import 'package:coretec/Pages/PlantasTratamientoPage.dart';
import 'package:coretec/Pages/PorqueReciclarRaeePage.dart';
import 'package:coretec/Pages/QueSonLasRaeePage.dart';
import 'package:coretec/Pages/QuienesSomosPage.dart';
import 'package:coretec/Pages/ReciclarRaeesPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Widgets/DrawerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthProvider>(
      context,
      listen: true,
    ).user;
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(0),
        width: size.width,
        height: size.height,
        color: Color.fromARGB(255, 253, 248, 222),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 5,
              ),
              width: size.width,
              height: size.height * 0.20,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("Assets/Images/fondo_drawer.png")),
              ),
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: user!.photoURL == "imagenLocal"
                        ? SvgPicture.asset(
                            "Assets/Images/robot_usuario.svg",
                            width: 95,
                          )
                        : Image.network(
                            user.photoURL as String,
                            width: 95,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      user.displayName as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      user.email as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: size.height * 0.80,
                width: size.width,
                child: ListView(
                  children: [
                    DrawerItem(
                      image: "ic_reciclar.svg",
                      title: "Reciclar RAEEs",
                      route: ReciclarRaeesPage.routeName,
                    ),
                    DrawerItem(
                      image: "recycled.svg",
                      title: "Historial de Reciclaje",
                      route: HistorialReciclajePage.routeName,
                    ),
                    DrawerItem(
                      image: "pregunta.svg",
                      title: "¿Que son los RAEE?",
                      route: QueSonLasRaeePage.routeName,
                    ),
                    DrawerItem(
                      image: "recycling-bin.svg",
                      title: "¿Porque Reciclar RAEE?",
                      route: PorqueReciclarRaeePage.routeName,
                    ),
                    DrawerItem(
                      image: "recycling-center.svg",
                      title: "Plantas de Tratamiento",
                      route: PlantasTratamientoPage.routeName,
                    ),
                    DrawerItem(
                      image: "teamwork.svg",
                      title: "Quienes Somos",
                      route: QuienesSomosPage.routeName,
                    ),
                    Divider(),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        "Utilidades",
                        style: TextStyle(color: Colors.black38, fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    DrawerItem(
                      image: "call.svg",
                      title: "Contactanos",
                      route: ContactanosPage.routeName,
                    ),
                    DrawerItem(
                      image: "settings.svg",
                      title: "Ajustes",
                      route: AjuestesPage.routeName,
                    ),
                    DrawerItem(
                      image: "logout.svg",
                      title: "Cerrar Sesion",
                      route: "LogOut",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
