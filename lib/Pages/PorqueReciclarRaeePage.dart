import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PorqueReciclarRaeePage extends StatelessWidget {
  static const routeName = "/PorqueReciclarRaeePage";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("¿Porque Reciclar?"),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          color: Color.fromARGB(255, 238, 238, 238),
          child: Column(
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
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Razones por el cual reciclar RAEE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                              "Assets/Images/tag.svg",
                              width: size.width * 0.10,
                            ),
                          ),
                          Container(
                            width: size.width * 0.70,
                            child: Text(
                                "Prevenir la generación de Residuos de Aparatos Eléctricos y Electrónicos (RAEE) y la peligrosidad de los componenetes"),
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
                              "Assets/Images/tag.svg",
                              width: size.width * 0.10,
                            ),
                          ),
                          Container(
                            width: size.width * 0.70,
                            child: Text(
                                "Fomentar la reutilziacion de los Aparatos Eléctricos y Electrónicos, el reciclado y la valorizacion de sus residuos"),
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
                              "Assets/Images/tag.svg",
                              width: size.width * 0.10,
                            ),
                          ),
                          Container(
                            width: size.width * 0.70,
                            child: Text(
                                "Determinar una gestipon adecuada, Tratando de mejorar la eficiencia de la proteccion ambiental"),
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
                              "Assets/Images/tag.svg",
                              width: size.width * 0.10,
                            ),
                          ),
                          Container(
                            width: size.width * 0.70,
                            child: Text(
                                "Mejorar el comportamiento ambiental de todos los agentes que intervienen en el ciclo de vida de los RAEE"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: size.width * 0.50,
                child: Image.asset("Assets/Images/beneficio.png"),
              )
            ],
          ),
        ));
  }
}
