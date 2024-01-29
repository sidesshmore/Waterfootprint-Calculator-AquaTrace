import 'package:aqua_trace/features/Login/ui/login.dart';
import 'package:aqua_trace/features/Register/ui/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
    },
  ));
}
