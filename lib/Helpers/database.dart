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
