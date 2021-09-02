import 'package:coretec/Helpers/database.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiPerfilPage extends StatelessWidget {
  static const routeName = "/MiPerfilPage";

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

  Future<Map<String, dynamic>> getUserData(String userUid) async {
    return await getUserByUid(userUid);
  }

  getData(userUid) {
    return getUserData(userUid);
  }

  @override
  Widget build(BuildContext context) {
    var userUid = Provider.of<AuthProvider>(
      context,
      listen: true,
    ).user!.uid;
    var user = getData(userUid) as Map<String, dynamic>;
    print("User final: ${user}");
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar información del perfil"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            userData("Em@il:", user["email"] as String),
            userData("Nombre(s):", user["name"]),
            userData("Apellidos:", user["lastName"] as String),
            userData("Teléfono fijo:", user["phoneNumber"] as String),
          ],
        ),
      ),
    );
  }
}
