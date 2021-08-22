import 'package:firebase_auth/firebase_auth.dart';
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
  var gender = "Masculino";
  var _form = GlobalKey<FormState>();
  var _showPassword = false;

  Future<void> sendForm() async {
    if (_form.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail.value.text,
          password: password.value.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          print("The password provided is too weak.");
        } else if (e.code == "email-already-in-use") {
          print("The account already exists for that email.");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromARGB(150, 76, 175, 80),
            Colors.white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        height: size.height,
        width: size.width,
        child: Center(
          child: Container(
            height: size.height * 0.70,
            width: size.width * 0.90,
            child: SingleChildScrollView(
              child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: size.width * 0.90,
                          margin: const EdgeInsets.all(5),
                          child: TextFormField(
                            validator: (value) {
                              if (value != null) {
                                RegExp regExp = new RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                                  caseSensitive: false,
                                  multiLine: false,
                                );
                                if (value.isEmpty) {
                                  return "Favor indicar un correo";
                                } else if (!regExp.hasMatch(value)) {
                                  return "Favor digitar un correo valido.";
                                }
                                return null;
                              } else {
                                return "El correo electronico es nulo.";
                              }
                            },
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
                            validator: (value) {
                              print(value);
                              if (value == null) {
                                return "Favor digite su contraseña.";
                              }
                              if (value.isEmpty) {
                                return "Favor digite su contraseña.";
                              }
                              return null;
                            },
                            obscureText: !_showPassword,
                            controller: password,
                            cursorColor: Color.fromARGB(255, 76, 175, 80),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  icon: Icon(_showPassword
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye)),
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
                            validator: (value) {
                              if (value == null) {
                                return "Favor digite su nombre.";
                              }
                              if (value.isEmpty) {
                                return "Favor digite su nombre.";
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null) {
                                return "Favor digite su apellido.";
                              }
                              if (value.isEmpty) {
                                return "Favor digite su apellido.";
                              }
                              return null;
                            },
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
                      Container(
                        width: size.width * 0.90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: size.width * 0.25,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Favor digite su edad.";
                                    }
                                    if (value.isEmpty) {
                                      return "Favor digite su edad.";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: age,
                                  cursorColor: Color.fromARGB(255, 76, 175, 80),
                                  decoration: InputDecoration(
                                    hintText: "Edad",
                                    focusColor:
                                        Color.fromARGB(255, 76, 175, 80),
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
                              // width: size.width * 0.60,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: DropdownButton(
                                value: gender,
                                items:
                                    <String>["Masculino", "Femenino"].map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    gender = value as String;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        child: ElevatedButton(
                          onPressed: () {
                            sendForm();
                          },
                          child: Text(
                            "Registrar Cuenta",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 76, 175, 80)),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
