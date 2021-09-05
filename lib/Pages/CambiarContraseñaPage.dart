import 'package:flutter/material.dart';

class CambiarContraseniaPage extends StatefulWidget {
  static const routeName = "/CambiarContraseniaPage";

  @override
  _CambiarContraseniaPageState createState() => _CambiarContraseniaPageState();
}

class _CambiarContraseniaPageState extends State<CambiarContraseniaPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cambiar contraseña:"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
        ));
  }
}
