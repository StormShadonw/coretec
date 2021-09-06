import 'package:coretec/Pages/CambiarContrase%C3%B1aPage.dart';
import 'package:coretec/Pages/EditarMiNombrePage.dart';
import 'package:coretec/Pages/EditarMiNumeroPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiPerfilPage extends StatefulWidget {
  static const routeName = "/MiPerfilPage";

  @override
  _MiPerfilPageState createState() => _MiPerfilPageState();
}

class _MiPerfilPageState extends State<MiPerfilPage> {
  var userToShow;
  bool _isLoading = false;

  Widget editInfo(
      {required String label,
      required String icon,
      required String route,
      required Size size}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.20,
                  child: Text("$icon"),
                ),
                Container(
                  width: size.width * 0.80,
                  child: Text(
                    "$label",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
        width: size.width,
        // height: 75,
      ),
    );
  }

  Widget userData(String label, String value) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _isLoading = true;
    });

    Provider.of<AuthProvider>(
      context,
      listen: true,
    ).userFromDatabase.then((value) {
      setState(() {
        userToShow = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar información del perfil"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: size.width,
              height: size.height,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 2)
                        ]),
                    width: size.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Mis datos:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  userData("Em@il:",
                      userToShow == null ? "-" : userToShow["email"] as String),
                  userData("Nombre(s):",
                      userToShow == null ? "-" : userToShow["name"]),
                  userData(
                      "Apellidos:",
                      userToShow == null
                          ? "-"
                          : userToShow["lastName"] as String),
                  userData(
                      "Teléfono fijo:",
                      userToShow == null || userToShow["phoneNumber"] == "null"
                          ? "-"
                          : userToShow["phoneNumber"] as String),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 2)
                        ]),
                    width: size.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Opciones:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  editInfo(
                      label: "Editar mi nombre",
                      icon: "Some Icon",
                      route: EditarMiNombrePage.routeName,
                      size: size),
                  editInfo(
                      label: "Editar mi teléfono",
                      icon: "Some Icon",
                      route: EditarMiNumeroPage.routeName,
                      size: size),
                  if (int.parse(userToShow["age"]) > 0)
                    editInfo(
                        label: "Cambiar mi contraseña",
                        icon: "Some Icon",
                        route: CambiarContrasenaPage.routeName,
                        size: size),
                ],
              ),
            ),
    );
  }
}
