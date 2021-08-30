import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactanosPage extends StatelessWidget {
  static const routeName = "/ContactanosPage";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactanos"),
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
                "Telefono para atención",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
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
                        "Assets/Images/call.svg",
                        width: 30,
                      )),
                  Container(
                    width: size.width * 0.65,
                    child: Text("(+51) 910866880"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.all(5),
              child: Text(
                "Otros medios de contacto",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
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
                        "Assets/Images/whatsapp.svg",
                        width: 30,
                      )),
                  Container(
                    width: size.width * 0.65,
                    child: Text("(+51) 910866880"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: Color.fromARGB(255, 255, 255, 255),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                      width: size.width * 0.35,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        "Assets/Images/gmail.svg",
                        width: 30,
                      )),
                  Container(
                    width: size.width * 0.65,
                    child: Text("maycolft@gmail.com"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.all(5),
              child: Text(
                "Horario de atención",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: Color.fromARGB(255, 255, 255, 255),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                      width: size.width * 0.35,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        "Assets/Images/clock.svg",
                        width: 30,
                      )),
                  Container(
                    width: size.width * 0.65,
                    child: Text("L-S 09:00hr - 18:00hr"),
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
