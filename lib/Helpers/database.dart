import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveUser(
    String uid, String name, String lastName, String age, String phoneNumber) {
  var id = databaseReference.child("users/").push();
  id.set({
    "uid": uid,
    "name": name,
    "lastName": lastName,
    "age": age,
    "phoneNumber": phoneNumber,
  });
  return id;
}
