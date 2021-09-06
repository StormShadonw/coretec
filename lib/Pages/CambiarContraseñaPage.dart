import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CambiarContrasenaPage extends StatefulWidget {
  static const routeName = "/CambiarContraseñaPage";

  @override
  _CambiarContrasenaPageState createState() => _CambiarContrasenaPageState();
}

class _CambiarContrasenaPageState extends State<CambiarContrasenaPage> {
  var _form = GlobalKey<FormState>();
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
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
        });
      });
      _isLoaded = true;
    }
  }

  void sendForm() {
    if (_form.currentState!.validate()) {
      Provider.of<AuthProvider>(
        context,
        listen: false,
      ).changePassword(oldPassword.value.text, newPassword.value.text);
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
            : SingleChildScrollView(
                // reverse: true,
                child: Container(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                color: Color.fromARGB(255, 245, 245, 245),
                                alignment: Alignment.center,
                                width: size.width * 0.90,
                                child: Text(
                                  "Cambiar contraseña:",
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
                                        "Ingresa tu contraseña actual",
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
                                            return "Favor proveer una contraseña.";
                                          }
                                          if (value.isEmpty) {
                                            return "Favor proveer una contraseña.";
                                          }
                                        },
                                        obscureText: true,
                                        controller: oldPassword,
                                      ),
                                    ),
                                  ],
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
                                        "Ingresa tu nueva contraseña",
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
                                            return "Favor proveer una nueva contraseña.";
                                          }
                                          if (value.isEmpty) {
                                            return "Favor proveer una nueva contraseña.";
                                          }
                                        },
                                        obscureText: true,
                                        controller: newPassword,
                                      ),
                                    ),
                                  ],
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
                                        "Confirma tu nueva contraseña",
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
                                            return "Favor confirmar su nueva contraseña.";
                                          }
                                          if (value.isEmpty) {
                                            return "Favor confirmar su nueva contraseña.";
                                          }
                                          if (value != newPassword.value.text) {
                                            return "Esta contraseña no es identica a la suministrada anteriormente.";
                                          }
                                        },
                                        obscureText: true,
                                        controller: confirmPassword,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: size.width * 0.90,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 20)),
                                    onPressed: () {
                                      sendForm();
                                    },
                                    child: Text(
                                      "Cambiar contraseña",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: size.width * 0.90,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 20)),
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
                ),
              ));
  }
}
