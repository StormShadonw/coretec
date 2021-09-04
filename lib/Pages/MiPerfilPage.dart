import 'dart:async';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiPerfilPage extends StatefulWidget {
  static const routeName = "/MiPerfilPage";

  @override
  _MiPerfilPageState createState() => _MiPerfilPageState();
}

class _MiPerfilPageState extends State<MiPerfilPage> {
  var user;
  var userToShow;
  bool _isLoading = false;

  Widget userData(String label, String value) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getUserData() async {
    user = await Provider.of<AuthProvider>(
      context,
      listen: true,
    ).userFromDatabase;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserData();
    setState(() {
      _isLoading = true;
    });
    Timer(
        Duration(
          seconds: 3,
        ), () async {
      setState(() {
        userToShow = user;
        _isLoading = false;
        print(userToShow["phoneNumber"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar información del perfil"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: size.width,
              height: size.height,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  userData("Em@il:",
                      userToShow == null ? "-" : userToShow["email"] as String),
                  userData("Nombre(s):",
                      userToShow == null ? "-" : userToShow["name"]),
                  userData(
                      "Apellidos:",
                      userToShow == null
                          ? "-"
                          : userToShow["lastName"] as String),
                  userData(
                      "Teléfono fijo:",
                      userToShow == null || userToShow["phoneNumber"] == "null"
                          ? "-"
                          : userToShow["phoneNumber"] as String),
                ],
              ),
            ),
    );
  }
}
