import 'package:coretec/Models/CartItem.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  addCartItemToCart(CartItem item) {}
}
