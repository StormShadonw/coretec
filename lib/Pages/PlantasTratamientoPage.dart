import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantasTratamientoPage extends StatelessWidget {
  static const routeName = "/PlantasTratamientoPage";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas de Tratamiento"),
      ),
      body: Column(
        children: [
          Container(
            width: size.width * 0.95,
            // height: 120,
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
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "¿Donde llevar mis RAEE?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text(
                            "SAR Av. los Ciruelos 526. San Juan de Lurigancho"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text("COIPSA Av. Argentina 5064 - Callao"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text(
                            "COMNTEL Av. Prolongacion Industrial 8032. Los Olivos"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text("AKS Av. Primavera 120. Santiago de Surco"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text(
                            "MUN. MOLINA Av. Ricardo Elias Aparicio 740. La Molina 15026"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text(
                            "MUN. MIRAFLORES Av. Jose Larco 400. Miraflores"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        child: SvgPicture.asset(
                          "Assets/Images/ubicacion.svg",
                          width: size.width * 0.10,
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        child: Text(
                            "RECOLEC Av. Alfredo Mendiola 8034. San Martin de Porres</string>"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            // width: 50,
            // height: 50,
          ),
        ],
      ),
    );
  }
}
