import 'package:flutter/material.dart';

class QueSonLasRaeePage extends StatelessWidget {
  static const routeName = "/QueSonLasRaeePage";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("¿Que son los RAEE?"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Color.fromARGB(255, 238, 238, 238),
        child: Column(
          children: [
            Container(
              width: size.width * 0.90,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Text(
                "Segun RAEE PERÚ: Los Residuos de Aparatos Eléctricos y Electrónicos (RAEE), se denomina a cualquier dispositivos que utilice un suministro de energia eléctrica o una bateria, y que haya alcanzado el fin de su vida util. A continuación se presenta sus Categorias:",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            Container(
              width: size.width * 0.90,
              margin: const EdgeInsets.all(10),
              child: Image.asset("Assets/Images/categoria.png"),
            ),
            Container(
              width: size.width * 0.90,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Text(
                "Estos residuos son una mezcla compleja de varios materiales, algunos de los cuales son materias primas escasas y valiosas que ameritan ser recuperados (plásticos, metales ferrosos y no ferrosos) y otros (mercurio, cadmio, cromo, plomo, etc.) que si bien no generan problemas durante su uso se convierten en un peligro a la salud y al medio ambiente cuando se liberan bajo condiciones inadecuadas e informales",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
