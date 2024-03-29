import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveItemCart(
    String name, String brand, int cantity, String itemType, String uid) {
  var id = databaseReference.child("cartItems/").push();
  print("id: ${id.key}");
  id.set({
    "uid": uid,
    "name": name,
    "brand": brand,
    "cantity": cantity,
    "itemType": itemType,
    "id": id.key,
  });
  return id;
}

void deleteItemCart(String id) {
  databaseReference.child("cartItems/").child(id).remove();
}

Future<List<MapEntry<String, dynamic>>> getItemsCart(String uid) async {
  var user = await databaseReference.child("cartItems/").once();
  // var userToReturn;

  if (user.exists) {
    var jsondecode = new Map<String, dynamic>.from(user.value);
    var userMapEntry = jsondecode.entries
        .toList()
        .where((element) => element.value["uid"] == uid)
        .toList();
    return userMapEntry;
  }
  return [];
}

DatabaseReference saveUser(String uid, String name, String lastName, String age,
    String phoneNumber, String email) {
  var id = databaseReference.child("users/").push();
  id.set({
    "uid": uid,
    "name": name,
    "lastName": lastName,
    "age": age,
    "phoneNumber": phoneNumber,
    "email": email,
  });
  return id;
}

Future<DataSnapshot> returnTableUsers() async {
  return await databaseReference.child("users/").once();
}

Future<Map<String, dynamic>> updateUser(Map<String, dynamic> user) {
  print(user);
  databaseReference.child("users/").child(user["id"]).update(user);
  return getUserByUid(user["uid"]);
}

updateCartItemDatabase(Map<String, dynamic> cartItem) {
  databaseReference.child("cartItems/").child(cartItem["id"]).update(cartItem);
  // return getCartItemByUid(cartItem["uid"]);
}

Future<Map<String, dynamic>> getUserByUid(String uid) async {
  var user = await returnTableUsers();
  var userToReturn;

  if (user.exists) {
    var jsondecode = new Map<String, dynamic>.from(user.value);
    var userMapEntry = jsondecode.entries
        .toList()
        .where((element) => element.value["uid"] == uid)
        .first;

    userToReturn = {
      "email": userMapEntry.value["email"],
      "name": userMapEntry.value["name"],
      "lastName": userMapEntry.value["lastName"],
      "phoneNumber": userMapEntry.value["phoneNumber"],
      "uid": userMapEntry.value["uid"],
      "age": userMapEntry.value["age"],
      "id": userMapEntry.key
    };
  }
  return userToReturn;
}

Future<bool> isEmailUsed(String email) async {
  var user = await databaseReference.child("users/").once().then((value) {
    if (value.exists) {
      var jsondecode = new Map<String, dynamic>.from(value.value);

      if (jsondecode.entries
              .toList()
              .where((element) => element.value["email"] == email)
              .length >
          0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  });
  return user;
}
