import 'dart:async';

import 'package:coretec/Helpers/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  Future<dynamic> get userFromDatabase async {
    return await getUserByUid(_user!.uid);
  }

  User? get user {
    if (_user != null) {
      return _user;
    }
    return null;
  }

  bool get isAuth {
    if (FirebaseAuth.instance.currentUser != null) {
      _user = FirebaseAuth.instance.currentUser;
      return true;
    } else {
      return false;
    }
  }

  void changePassword(String oldPassword, String newPassword) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: currentUser!.email as String, password: oldPassword);

    currentUser.reauthenticateWithCredential(cred).then((value) {
      currentUser.updatePassword(newPassword).then((value) {});
    });
  }

  Future<String> signInWithGoogle() async {
    // Trigger the authentication flow
    // if (GoogleSignIn().currentUser != null) {
    //   await GoogleSignIn().disconnect();
    // }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    var _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    _user = _userCredential.user;
    print(_user);

    if (await isEmailUsed(_user!.email as String) == false) {
      saveUser(
        _user!.uid,
        _user!.displayName!.split(" ")[0],
        _user!.displayName!.split(" ").length == 2
            ? _user!.displayName!.split(" ")[1]
            : _user!.displayName!.split(" ")[2],
        "0",
        _user!.phoneNumber == null ? "null" : _user!.phoneNumber as String,
        user!.email as String,
      );
    }

    notifyListeners();
    return "Logeado";
  }

  Future<void> logOut() async {
    userFromDatabase.then((value) async {
      if (int.parse(value["age"]) == 0) {
        await GoogleSignIn().disconnect();
      }
      await FirebaseAuth.instance.signOut();
      _user = null;
      notifyListeners();
    });
  }

  Future<String> logIn(String mail, String password) async {
    try {
      var _userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
      _user = _userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No hay cuenta registrada con ese correo.";
      } else if (e.code == 'wrong-password') {
        return "Contraseña erronea.";
      }
    }
    notifyListeners();
    if (_user != null) {
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
      var _userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMail,
        password: password,
      );
      _user = _userCredential.user;
      User user = _userCredential.user as User;
      user.updateDisplayName(name + " " + lastName);
      user.updatePhotoURL("imagenLocal");
      saveUser(
        _userCredential.user!.uid,
        name,
        lastName,
        age,
        phoneNumber,
        user.email as String,
      );
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
    if (_user == null) {
      return "No ha sido posible registrar la cuenta, favor intentar mas tarde.";
    }
    return "Registrado";
  }
}
