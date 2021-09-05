import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarMiNombrePage extends StatefulWidget {
  static const routeName = "/EditarMiNombrePage";

  @override
  _EditarMiNombrePageState createState() => _EditarMiNombrePageState();
}

class _EditarMiNombrePageState extends State<EditarMiNombrePage> {
  var _form = GlobalKey<FormState>();
  var name = TextEditingController();
  var lastName = TextEditingController();
  var userToShow;
  bool _isLoading = false;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoaded) {
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
          name = TextEditingController(text: userToShow["name"]);
          lastName = TextEditingController(text: userToShow["lastName"]);
        });
      });
      _isLoaded = true;
    }
  }

  void sendForm() {
    if (_form.currentState!.validate()) {
      var userToUpdate = userToShow;
      userToUpdate["name"] = name.value.text;
      userToUpdate["lastName"] = lastName.value.text;
      updateUser(userToUpdate);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar informacion del perfil:"),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.white,
                width: size.width,
                height: size.height,
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      Container(
                        // height: 150,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black26,
                                width: 1,
                                style: BorderStyle.solid)),
                        width: size.width * 0.90,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              color: Color.fromARGB(255, 245, 245, 245),
                              alignment: Alignment.center,
                              width: size.width * 0.90,
                              child: Text(
                                "Editar mi nombre:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.90,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Nombre(s)",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return "Favor proveer un nombre.";
                                        }
                                        if (value.isEmpty) {
                                          return "Favor proveer un nombre.";
                                        }
                                      },
                                      controller: name,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.90,
                              // padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Apellidos",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    width: size.width * 0.90,
                                    margin: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    alignment: Alignment.centerLeft,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return "Favor proveer un apellido.";
                                        }
                                        if (value.isEmpty) {
                                          return "Favor proveer un apellido.";
                                        }
                                      },
                                      controller: lastName,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: size.width * 0.35,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20)),
                                  onPressed: () {
                                    sendForm();
                                  },
                                  child: Text(
                                    "Guardar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                            Container(
                              width: size.width * 0.35,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20)),
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
