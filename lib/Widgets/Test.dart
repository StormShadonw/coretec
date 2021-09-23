import 'package:coretec/Pages/ListarReciclajesPage.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final future;

  Test({this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text("Loading data1...");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            // print("cart: ${snapshot}");
            return GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(ListarReciclajesPage.routeName),
              child: Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "Assets/Images/Caja.png",
                      width: 45,
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "${snapshot.data}",
                          style: TextStyle(fontSize: 12),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.purpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
