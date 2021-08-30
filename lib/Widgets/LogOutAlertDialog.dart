import 'package:coretec/Pages/HomePage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LogOutAlertDialog extends StatelessWidget {
  static void showWidgetDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Row(
                children: [
                  Container(
                    width: 55,
                    child: SvgPicture.asset(
                      "Assets/Images/chat.svg",
                      width: 55,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      "¿Estas seguro de que quieres salir?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("NO")),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).logOut();
                    Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName);
                    // Navigator.of(context).pop();
                  },
                  child: Text("SI")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
