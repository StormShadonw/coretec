import 'package:flutter/material.dart';

class WastePage extends StatelessWidget {
  const WastePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
