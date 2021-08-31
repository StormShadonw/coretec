import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

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

Future<bool> isEmailUsed(String email) async {
  var users = await databaseReference.child("users/").get();
  var decodedJson = json.decode(users.value);
  var user =
      (decodedJson as List).where((element) => element["email"] == email);

  print("User value: ${user}");
  if (user != null) {
    return true;
  }
  return false;
}
