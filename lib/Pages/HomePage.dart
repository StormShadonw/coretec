import 'package:coretec/Pages/NewAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _splashScreenFinishAnimation = false;
  late final AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _splashScreenFinishAnimation
            ? Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Assets/Images/fondo.png"),
                      fit: BoxFit.fill),
                ),
                child: Center(
                    child: Container(
                  height: size.height * 0.85,
                  width: size.width * 0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: size.width * 0.90,
                        height: size.height * 0.40,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: size.width * 0.55,
                              child: Image.asset(
                                "Assets/Images/enchu.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: size.width * 0.75,
                              child: Image.asset(
                                "Assets/Images/ic_logo.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        height: size.height * 0.45,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: size.width * 0.75,
                              height: size.height * 0.07,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Iniciar Sesión con CORETEC",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 76, 175, 80)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: size.width * 0.75,
                              height: size.height * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NewAccountPage()));
                                },
                                child: Text(
                                  "Crear una Cuenta",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 255, 179, 0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              )
            : Container(
                child: Lottie.asset("Assets/Animations/recycle.json",
                    controller: _controller, onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().then((value) {
                      setState(() {
                        _splashScreenFinishAnimation = true;
                      });
                      print("Value: Somethign happening");
                    });
                }),
              ),
      ),
    );
  }
}
