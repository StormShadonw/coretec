import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _showPassword = false;
  var mail = new TextEditingController();
  var password = new TextEditingController();
  var _form = GlobalKey<FormState>();

  Future<void> logIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail.value.text,
        password: password.value.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print("Logeado");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final String assetEath = 'Assets/Images/planet-earth.svg';

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
        child: SingleChildScrollView(
          child: Center(
              child: Container(
            width: size.width * 0.85,
            height: size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  width: size.width * 0.45,
                  height: size.height * 0.30,
                  child: SvgPicture.asset(assetEath),
                ),
                Container(
                  width: size.width * 0.90,
                  child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.90,
                            margin: const EdgeInsets.all(5),
                            child: TextFormField(
                              validator: (value) {
                                RegExp regExp = new RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                                  caseSensitive: false,
                                  multiLine: false,
                                );
                                if (value == null) {
                                  return "Favor digite su correo.";
                                } else if (!regExp.hasMatch(value)) {
                                  return "Favor digitar un correo valido.";
                                } else if (value.isEmpty) {
                                  return "Favor digite su correo.";
                                }
                                return null;
                              },
                              controller: mail,
                              cursorColor: Color.fromARGB(255, 76, 175, 80),
                              decoration: InputDecoration(
                                prefixIcon: SvgPicture.asset(
                                  "Assets/Images/boy.svg",
                                  semanticsLabel: "User",
                                  allowDrawingOutsideViewBox: true,
                                  width: 30.0,
                                  height: 30.0,
                                ),
                                hintText: "Correo Eletronico",
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
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  width: size.width * 0.90,
                  child: Form(
                      child: Column(
                    children: [
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.all(5),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null) {
                              return "Favor digite su correo.";
                            }
                            if (value.isEmpty) {
                              return "Favor digite su correo.";
                            }
                            return null;
                          },
                          controller: password,
                          obscureText: !_showPassword,
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
                            prefixIcon: SvgPicture.asset(
                              "Assets/Images/padlock.svg",
                              semanticsLabel: "User",
                              allowDrawingOutsideViewBox: true,
                              width: 30.0,
                              height: 30.0,
                            ),
                            hintText: "Contraseña",
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
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "¿Olvidaste tu contraseña?",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16),
                            )),
                      ),
                      Container(
                        width: size.width * 0.75,
                        child: ElevatedButton(
                          onPressed: () {
                            logIn();
                          },
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              primary: Color.fromARGB(255, 76, 175, 80)),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
