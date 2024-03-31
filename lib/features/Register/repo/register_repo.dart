import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo{
  static Future<User?> register(String name,String email,String password)async{
    FirebaseAuth auth=FirebaseAuth.instance;
    try {
      UserCredential credential=await auth.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
      print(credential.toString());
      return credential.user;
      
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}