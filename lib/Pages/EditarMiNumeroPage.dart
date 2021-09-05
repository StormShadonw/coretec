import 'package:flutter/material.dart';

class EditarMiNumeroPage extends StatefulWidget {
  static const routeName = "/EditarMiNumeroPage";

  @override
  _EditarMiNumeroPageState createState() => _EditarMiNumeroPageState();
}

class _EditarMiNumeroPageState extends State<EditarMiNumeroPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar mi numero de contacto:"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
        ));
  }
}
