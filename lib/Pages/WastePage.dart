import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WastePage extends StatelessWidget {
  const WastePage({Key? key}) : super(key: key);
  static const routeName = "/waste_page";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("CORETEC"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(
                context,
                listen: false,
              ).logOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
