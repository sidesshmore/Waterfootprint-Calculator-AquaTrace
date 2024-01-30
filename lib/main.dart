import 'package:aqua_trace/aqua_trace.dart';
import 'package:aqua_trace/blog.dart';
import 'package:aqua_trace/charts.dart';
import 'package:aqua_trace/TestWidgets/error.dart';
import 'package:aqua_trace/TestWidgets/successful.dart';
import 'package:aqua_trace/features/Login/ui/login.dart';
import 'package:aqua_trace/profile_page.dart';
import 'package:aqua_trace/features/Register/ui/register.dart';
import 'package:aqua_trace/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aqua_trace/share.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'success':(context)=>const Success(),
      'errors':(context)=>const ErrorScreen(),
      'profile': (context) => ProfilePage(),
      'blog': (context) => BlogPage(),
      'aqua_trace': (context) => AquaTrace(),
      'charts': (context) => ChartsPage(),
      'share': (context) => Share(),
    },
  ));
}
