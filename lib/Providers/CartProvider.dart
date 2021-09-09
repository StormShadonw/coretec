import 'package:coretec/Helpers/database.dart';
import 'package:coretec/Models/CartItem.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  loadAllItemsCart(String uid) async {
    var records = await getItemsCart(uid);
    var recordsToList = [];
    var index = 0;
    records.map((e) {
      cartItems.add({
        "name": records[index].value["name"],
        "brand": records[index].value["brand"],
        "cantity": records[index].value["cantity"],
        "itemType": records[index].value["itemType"],
        "uid": records[index].value["uid"],
        "id": records[index].value["id"],
      });
    });
    notifyListeners();
  }

  addCartItemToCart(Map<String, dynamic> item) {
    print("Item: $item");
    saveItemCart(item["name"], item["brand"], item["cantity"], item["itemType"],
        item["uid"]);
    loadAllItemsCart(item["uid"]);
    notifyListeners();
  }
}
