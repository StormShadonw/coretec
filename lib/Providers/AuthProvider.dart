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

  Future<String> logIn(String mail, String password) async {
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No hay cuenta registrada con ese correo.";
      } else if (e.code == 'wrong-password') {
        return "Contraseña erronea.";
      }
    }
    notifyListeners();
    if (_userCredential != null) {
      return "Logeado";
    }
    return "Datos erroneos, favor intentar nuevamente.";
  }

  Future<String> signUp({
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
      User user = _userCredential!.user as User;
      user.updateDisplayName(name + " " + lastName);
      user.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/coretec-d342e.appspot.com/o/robot%20usuario.svg?alt=media&token=865f2c59-d56c-43ed-911b-fa62658f63b0");
      saveUser(_userCredential!.user!.uid, name, lastName, age, phoneNumber);
      notifyListeners();
      return "Registrado";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return "La contraseña es muy debil.";
      } else if (e.code == "email-already-in-use") {
        return "Ya hay una cuenta registrada con ese email. Favor proveer otro correo o acceder con este.";
      }
    } catch (e) {
      print(e);
    }
    if (_userCredential == null) {
      return "No ha sido posible registrar la cuenta, favor intentar mas tarde.";
    }
    return "Registrado";
  }
}
