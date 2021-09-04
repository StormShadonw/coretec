import 'package:coretec/Pages/MiPerfilPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Widgets/LogOutAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AjustesPage extends StatelessWidget {
  static const routeName = "/AjustesPage";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes de Usuario"),
      ),
      body: Container(
        width: size.width,
        color: Color.fromARGB(255, 238, 238, 238),
        height: size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.all(5),
              child: Text(
                "Informacion de la Cuenta",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  MiPerfilPage.routeName,
                  arguments: Provider.of<AuthProvider>(context, listen: false)
                      .user!
                      .uid),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Color.fromARGB(255, 255, 255, 255),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                        width: size.width * 0.35,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          "Assets/Images/miPerfil.svg",
                          width: 30,
                        )),
                    Container(
                      width: size.width * 0.65,
                      child: Text(
                        "Mi Perfil",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.all(5),
              child: Text(
                "Otros",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                LogOutAlertDialog.showWidgetDialog(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Color.fromARGB(255, 255, 255, 255),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                        width: size.width * 0.35,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          "Assets/Images/logout.svg",
                          width: 30,
                        )),
                    Container(
                      width: size.width * 0.65,
                      child: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
