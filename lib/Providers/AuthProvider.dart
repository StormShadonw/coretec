import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String _tokenId = "";
  DateTime _tokenExpiresTime = new DateTime(2021);
  String _userId = "";
  late UserCredential _userCredential;
  // Timer _authTimer = Timer(12, callback);

  bool get isAuth {
    return _userCredential.user!.uid.isNotEmpty;
  }

  Future<void> signUp({
    required String eMail,
    required String password,
    required String name,
    required String lastName,
    required String photoUrl,
    required String phoneNumber,
    required age,
  }) async {
    try {
      _userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMail,
        password: password,
      );
      User user = _userCredential.user as User;
      user.updateDisplayName(name + " " + lastName);
      user.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/coretec-d342e.appspot.com/o/robot%20usuario.svg?alt=media&token=865f2c59-d56c-43ed-911b-fa62658f63b0");
      saveUser(_userCredential.user!.uid, name, lastName, age, phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
