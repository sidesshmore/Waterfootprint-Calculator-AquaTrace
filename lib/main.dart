import 'package:aqua_trace/aqua_trace.dart';
import 'package:aqua_trace/blog.dart';
import 'package:aqua_trace/charts.dart';
import 'package:aqua_trace/login.dart';
import 'package:aqua_trace/profile_page.dart';
import 'package:aqua_trace/register.dart';
import 'package:aqua_trace/share.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'register': (context) => Register(),
      'profile': (context) => ProfilePage(),
      'blog': (context) => BlogPage(),
      'aqua_trace': (context) => AquaTrace(),
      'charts': (context) => ChartsPage(),
      'share': (context) => Share(),
    },
  ));
}
