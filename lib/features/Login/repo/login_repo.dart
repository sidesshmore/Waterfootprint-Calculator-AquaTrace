import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo{
  static Future<User?> login(String email,String password) async {
    final FirebaseAuth auth=FirebaseAuth.instance;
    try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
      log(credential.toString());
      return credential.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}