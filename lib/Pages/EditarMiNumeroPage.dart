import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarMiNumeroPage extends StatefulWidget {
  static const routeName = "/EditarMiNumeroPage";

  @override
  _EditarMiNumeroPageState createState() => _EditarMiNumeroPageState();
}

class _EditarMiNumeroPageState extends State<EditarMiNumeroPage> {
  var _form = GlobalKey<FormState>();
  var phoneNumber = TextEditingController();
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
          phoneNumber = TextEditingController(
              text: userToShow["phoneNumber"] == "null"
                  ? ""
                  : userToShow["phoneNumber"]);
        });
      });
      _isLoaded = true;
    }
  }

  void sendForm() {
    if (_form.currentState!.validate()) {
      var userToUpdate = userToShow;
      userToUpdate["phoneNumber"] = phoneNumber.value.text;
      updateUser(userToUpdate);
      Navigator.of(context).pop();
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
                                "Editar mi numero de contacto:",
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
                                      "Numero de telefono celular",
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
                                          return "Favor proveer un numero de telefono.";
                                        }
                                        if (value.isEmpty) {
                                          return "Favor proveer un numero de telefono.";
                                        }
                                      },
                                      keyboardType: TextInputType.phone,
                                      controller: phoneNumber,
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
