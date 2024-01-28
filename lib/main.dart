import 'package:aqua_trace/login.dart';
import 'package:aqua_trace/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'register': (context) => Register(),
    },
  ));
}
