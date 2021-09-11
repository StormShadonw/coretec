import 'package:coretec/Pages/ReciclarRaeesPage.dart';
import 'package:coretec/Providers/AuthProvider.dart';
import 'package:coretec/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewModal extends StatefulWidget {
  String itemType;
  AddNewModal({required this.itemType});

  @override
  _AddNewModalState createState() => _AddNewModalState();
}

class _AddNewModalState extends State<AddNewModal> {
  int cantity = 0;
  var _form = GlobalKey<FormState>();
  var brand = TextEditingController();
  bool _isLoading = false;

  void sendForm() async {
    if (cantity > 0) {
      if (_form.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        var user = await Provider.of<AuthProvider>(context, listen: false)
            .userFromDatabase;
        Provider.of<CartProvider>(
          context,
          listen: false,
        ).addCartItemToCart({
          "name": "${widget.itemType} ${brand.value.text}",
          "brand": brand.value.text,
          "cantity": cantity,
          "itemType": widget.itemType,
          "uid": user["uid"],
        });
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamedAndRemoveUntil(
            context, ReciclarRaeesPage.routeName, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom <= 10
              ? 55
              : MediaQuery.of(context).viewInsets.bottom,
          top: 10,
          left: 10,
          right: 10,
        ),
        alignment: Alignment.topCenter,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    child: Text("Imagen Robot"),
                  ),
                  Container(
                    child: Text(
                      "Residuo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.00,
                  ),
                  Container(
                    child: Form(
                        key: _form,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "Cantidad",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .primaryColor),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .primaryColor),
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
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "MARCA",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                          bottom: 5,
                                          left: 5,
                                          right: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        constraints:
                                            BoxConstraints(maxWidth: 220),
                                        child: TextFormField(
                                          controller: brand,
                                          validator: (value) {
                                            if (value == null) {
                                              return "Favor proveer marca del articulo.";
                                            }
                                            if (value.isEmpty) {
                                              return "Favor proveer marca del articulo.";
                                            }
                                          },
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText: "Marca de tu residuo",
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: cantity <= 0
                          ? null
                          : () {
                              sendForm();
                            },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "Agregar Articulo",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
