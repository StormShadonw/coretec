import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  Map<String, dynamic> cartItem;
  CartItemWidget({required this.cartItem});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int cantity = widget.cartItem["cantity"] as int;

    return Container(
      margin: const EdgeInsets.all(10),
      width: size.width * 0.90,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            child: Container(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: "${widget.cartItem["itemType"]}  |  Marca: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      children: <TextSpan>[
                    TextSpan(
                      text: "${widget.cartItem["brand"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ])),
              // child: Text(
              //   "${widget.cartItem["itemType"]} | Marca: ${widget.cartItem["brand"]}",
              //   textAlign: TextAlign.center,
              // ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    "Assets/Images/${widget.cartItem["itemType"]}.png",
                    width: size.width * 0.25,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Cantidad de Residuos",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (cantity > 0) {
                                setState(() {
                                  cantity--;
                                });
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor),
                              width: 55,
                              height: 55,
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 38,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 55,
                            height: 55,
                            child: Text(
                              "$cantity",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                cantity++;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor),
                              width: 55,
                              height: 55,
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 38,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          "Residuo(s)",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Eliminar",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
