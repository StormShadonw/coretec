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

Future<DataSnapshot> returnTableUsers() async {
  return await databaseReference.child("users/").once();
}

Map<String, dynamic> getUserByUid(String uid) {
  var user = returnTableUsers() as DataSnapshot;
  var userToReturn;

  if (user.exists) {
    var jsondecode = new Map<String, dynamic>.from(user.value);
    var userMapEntry = jsondecode.entries
        .toList()
        .where((element) => element.value["uid"] == uid)
        .first;

    print("UserMapEntry: $userMapEntry");

    userToReturn = {
      "email": userMapEntry.value["email"],
      "name": userMapEntry.value["name"],
      "lastName": userMapEntry.value["lastName"],
      "phoneNumber": userMapEntry.value["phoneNumber"],
      "uid": userMapEntry.value["uid"],
      "age": userMapEntry.value["age"],
    };
  }
  print("User to Return: ${userToReturn}");
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
