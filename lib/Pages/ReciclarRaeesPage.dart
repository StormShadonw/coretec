import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReciclarRaeesPage extends StatelessWidget {
  static const routeName = "/ReciclarRaeesPage";
  var objectsToReciclate = [];

  Widget GridChild(String label, String image) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              image,
              width: 75,
              height: 75,
            ),
          ),
          Container(
            color: Color.fromARGB(255, 73, 175, 77),
            width: 75,
            height: 55,
            child: Text(label),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("CORETEC"),
      ),
      body: Container(
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: [],
          ),
        ),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
