import 'package:coretec/Helpers/database.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  Future<List<Map<String, dynamic>>> cartItems(String uid) async {
    _cartItems.clear();
    await loadAllItemsCart(uid);
    notifyListeners();
    return _cartItems;
  }

  int count(String uid) {
    cartItems(uid).then((value) {
      var cart;
      var cantityInCart;
      cart = value;
      print("cart: $cart");
      for (var c = 0; c < cart.length; c++) {
        cantityInCart += cart[c]["cantity"] as int;
      }
      return cantityInCart;
    });
    throw Exception();
  }

  updateCartItem(Map<String, dynamic> cartItem) {
    updateCartItemDatabase(cartItem);
    // _cartItems.clear();
    // _cartItems = await cartItems(cartItem["uid"]);
    notifyListeners();
  }

  loadAllItemsCart(String uid) async {
    var records = await getItemsCart(uid);
    // var recordsToList = [];
    // var index = 0;
    for (var c = 0; c < records.length; c++) {
      _cartItems.add({
        "name": records[c].value["name"],
        "brand": records[c].value["brand"],
        "cantity": records[c].value["cantity"],
        "itemType": records[c].value["itemType"],
        "uid": records[c].value["uid"],
        "id": records[c].value["id"],
      });
    }
    notifyListeners();
  }

  addCartItemToCart(Map<String, dynamic> item) {
    saveItemCart(item["name"], item["brand"], item["cantity"], item["itemType"],
        item["uid"]);
    loadAllItemsCart(item["uid"]);
    notifyListeners();
  }
}
