import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuienesSomosPage extends StatelessWidget {
  static const routeName = "/QuienesSomosPage";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quienes Somos"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Color.fromARGB(255, 238, 238, 238),
        child: Column(
          children: [
            Container(
              // height: 100,
              width: size.width * 0.90,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      "¿Quienes Somos?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Concientiza y Recicla Tecnología (CORETEC) es un aplicativo social que ofrece a los ciudadanos, empresas e instituciones una alternativa de reciclaje de sus RAEE (Residuos de Aparatos Eléctricos y Electrónicos) ayudando a disminuir los impactos en el medio ambiente y en la salud.",
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width * 0.45,
              height: size.height * 0.25,
              margin: const EdgeInsets.all(10),
              child: SvgPicture.asset("Assets/Images/ewaste.svg"),
            ),
            Container(
              width: size.width * 0.90,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      "Nuestro Compromiso",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Tenemos un compromiso con el MEDIO AMBIENTE y la salud de la comunidad por cada residuo electrónico que nuestra app logra acopiar y mandar directamente a un centro de acopio autorizado es un residuo menos de productos que no son quemados, enterrados, tirados al mar, exportado de manera ilegal, etc.",
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
