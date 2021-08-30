import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReciclarRaeesPage extends StatelessWidget {
  const ReciclarRaeesPage({Key? key}) : super(key: key);
  static const routeName = "/ReciclarRaeesPage";

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
          child: Text("First Page"),
        ),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
