import 'package:flutter/material.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  var mail = new TextEditingController();
  var password = new TextEditingController();
  var name = new TextEditingController();
  var lastName = new TextEditingController();
  var age = new TextEditingController();
  var gender = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Form(
            child: Column(
          children: [
            Container(
                width: size.width * 0.90,
                margin: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: mail,
                  cursorColor: Color.fromARGB(255, 76, 175, 80),
                  decoration: InputDecoration(
                    hintText: "Ingrese Correo Electronico",
                    focusColor: Color.fromARGB(255, 76, 175, 80),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                  ),
                )),
            Container(
                width: size.width * 0.90,
                margin: const EdgeInsets.all(5),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  cursorColor: Color.fromARGB(255, 76, 175, 80),
                  decoration: InputDecoration(
                    hintText: "Ingrese una contraseña",
                    focusColor: Color.fromARGB(255, 76, 175, 80),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                  ),
                )),
            Container(
                width: size.width * 0.90,
                margin: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: name,
                  cursorColor: Color.fromARGB(255, 76, 175, 80),
                  decoration: InputDecoration(
                    hintText: "Ingresa tu(s) Nombre(s)",
                    focusColor: Color.fromARGB(255, 76, 175, 80),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                  ),
                )),
            Container(
                width: size.width * 0.90,
                margin: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: lastName,
                  cursorColor: Color.fromARGB(255, 76, 175, 80),
                  decoration: InputDecoration(
                    hintText: "Ingresa tu(s) Apellido(s)",
                    focusColor: Color.fromARGB(255, 76, 175, 80),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.00,
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: size.width * 0.25,
                    margin: const EdgeInsets.all(5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      cursorColor: Color.fromARGB(255, 76, 175, 80),
                      decoration: InputDecoration(
                        hintText: "Edad",
                        focusColor: Color.fromARGB(255, 76, 175, 80),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.00,
                            color: Color.fromARGB(255, 76, 175, 80),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.00,
                            color: Color.fromARGB(255, 76, 175, 80),
                          ),
                        ),
                      ),
                    )),
                Container(
                    width: size.width * 0.65,
                    margin: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: gender,
                      cursorColor: Color.fromARGB(255, 76, 175, 80),
                      decoration: InputDecoration(
                        hintText: "Genero",
                        focusColor: Color.fromARGB(255, 76, 175, 80),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.00,
                            color: Color.fromARGB(255, 76, 175, 80),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.00,
                            color: Color.fromARGB(255, 76, 175, 80),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        )),
      ),
    );
  }
}