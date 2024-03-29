import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Providers/CartProvider.dart';
import 'package:coretec/Widgets/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ListarReciclajesPage extends StatefulWidget {
  static const routeName = "/ListarReciclajesPage";

  @override
  _ListarReciclajesPageState createState() => _ListarReciclajesPageState();
}

class _ListarReciclajesPageState extends State<ListarReciclajesPage> {
  List<Map<String, dynamic>> carts = [];
  var user;
  bool _isLoading = false;
  bool _isLoaded = false;

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
          carts = value;
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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: TextButton(onPressed: () {}, child: Text("CONTINUAR")),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Lista de Reciclaje"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : carts.length == 0
              ? Container(
                  child: Center(
                    child: SvgPicture.asset(""),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...carts
                            .map((e) => CartItemWidget(cartItem: e))
                            .toList()
                      ],
                    ),
                  ),
                ),
    );
  }
}
