import 'package:coretec/Pages/LogInPage.dart';
import 'package:coretec/Pages/NewAccountPage.dart';
import 'package:coretec/Pages/ReciclarRaeesPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
    var auth = Provider.of<AuthProvider>(
      context,
      listen: true,
    );
    print("Haciendo build: ${auth.isAuth}");
    var size = MediaQuery.of(context).size;
    return auth.isAuth
        ? ReciclarRaeesPage()
        : Scaffold(
            body:
                // auth.isAuth
                //     ? WastePage()
                //     :
                Center(
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
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(LoginPage.routeName);
                                      },
                                      child: Text(
                                        "Iniciar Sesión con CORETEC",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 76, 175, 80)),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    width: size.width * 0.75,
                                    height: size.height * 0.07,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Provider.of<AuthProvider>(
                                          context,
                                          listen: false,
                                        ).signInWithGoogle();
                                      },
                                      label: Text(
                                        "Continuar con Google",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      icon: Image.asset(
                                        "Assets/Images/googleIcon.png",
                                        width: 35,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                            width: 2,
                                            color: Colors.blue,
                                          ),
                                          primary: Color.fromARGB(
                                              255, 238, 238, 238)),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    width: size.width * 0.75,
                                    height: size.height * 0.07,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            NewAccountPage.routeName);
                                      },
                                      child: Text(
                                        "Crear una Cuenta",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 255, 179, 0)),
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
