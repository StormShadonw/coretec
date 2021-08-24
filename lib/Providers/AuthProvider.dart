import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  UserCredential? _userCredential;

  bool get isAuth {
    if (_userCredential != null) {
      return _userCredential!.user!.uid.isNotEmpty;
    }
    return false;
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
      print("Hey: $_userCredential");
      _userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMail,
        password: password,
      );
      print("Hey: $_userCredential");
      User user = _userCredential!.user as User;
      user.updateDisplayName(name + " " + lastName);
      user.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/coretec-d342e.appspot.com/o/robot%20usuario.svg?alt=media&token=865f2c59-d56c-43ed-911b-fa62658f63b0");
      saveUser(_userCredential!.user!.uid, name, lastName, age, phoneNumber);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
