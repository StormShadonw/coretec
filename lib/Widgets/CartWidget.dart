import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  bool _isLoading = false;
  bool _isLoaded = false;
  var user;
  var cart;
  int cantityInCart = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoaded) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AuthProvider>(
        context,
        listen: true,
      ).userFromDatabase.then((value) {
        user = value;
        Provider.of<CartProvider>(
          context,
          listen: false,
        ).cartItems(value["uid"]).then((value) {
          cart = value;
          for (var c = 0; c < cart.length; c++) {
            cantityInCart += cart[c]["cantity"] as int;
          }
          setState(() {
            _isLoading = false;
          });
        });
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.yellowAccent,
            ),
          )
        : Container(
            child: Text("${cantityInCart}"),
          );
  }
}
