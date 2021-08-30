import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/log_in_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _error = "";
  bool hasError = false;
  var _showPassword = false;
  var mail = new TextEditingController();
  var password = new TextEditingController();
  var _form = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> logIn() async {
    if (_form.currentState!.validate()) {
      var error = "";
      setState(() {
        _isLoading = true;
      });
      error = await Provider.of<AuthProvider>(context, listen: false)
          .logIn(mail.value.text, password.value.text);

      setState(() {
        _isLoading = false;
      });

      if (error == "Logeado") {
        setState(() {
          hasError = false;
        });
        Navigator.of(context).pop();
      } else {
        setState(() {
          hasError = true;
          _error = error;
        });
      }
    }
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
                              keyboardType: TextInputType.emailAddress,
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
                      if (hasError)
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Center(
                            child: Text(
                              _error,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
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
