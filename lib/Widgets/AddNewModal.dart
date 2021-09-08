import 'package:flutter/material.dart';

class AddNewModal extends StatefulWidget {
  const AddNewModal({Key? key}) : super(key: key);

  @override
  _AddNewModalState createState() => _AddNewModalState();
}

class _AddNewModalState extends State<AddNewModal> {
  int cantity = 0;
  var _form = GlobalKey<FormState>();

  void sendForm() {
    if (_form.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      alignment: Alignment.topCenter,
      child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cantity--;
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
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                constraints: BoxConstraints(maxWidth: 220),
                                child: TextFormField(
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
              onPressed: () {
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
    );
  }
}
