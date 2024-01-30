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
    initialRoute: 'profile',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'profile': (context) => const ProfilePage(),
      'blog': (context) => const BlogPage(),
      'aqua_trace': (context) => const AquaTrace(),
      'charts': (context) => const ChartsPage(),
      'share': (context) => const Share(),
    },
  ));
}
