import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum SignInState {
  UserNotFound,
  WrongPassword,
  LoggedIn,
}

class AuthProvider extends ChangeNotifier {
  late final FirebaseAuth auth;
  User? _user;

  AuthProvider() {
    auth = FirebaseAuth.instance;
  }

  bool isSignedIn() {
    return true;
    return _user != null;
  }

  User? get getUser => _user;

  Future<SignInState> signInEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return SignInState.UserNotFound;
      } else if (e.code == 'wrong-password') {
        return SignInState.WrongPassword;
      }
    }
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return SignInState.UserNotFound;
    } else {
      _user = user;
      notifyListeners();
      return SignInState.LoggedIn;
    }
  }

  Future<bool> registerEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      }
    } catch (e) {
      return false;
    }
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      _user = user;
      return true;
    }
  }
}
