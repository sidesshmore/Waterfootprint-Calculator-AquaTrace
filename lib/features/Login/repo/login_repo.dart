import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo{
  static Future<User?> login(String email,String password) async {
    final FirebaseAuth auth=FirebaseAuth.instance;
    try {
      UserCredential credential =await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}