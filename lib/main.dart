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
    initialRoute: 'profile',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'success':(context)=>const Success(),
      'errors':(context)=>const ErrorScreen(),
      'profile': (context) => const ProfilePage(),
      'blog': (context) => const BlogPage(),
      'aqua_trace': (context) => const AquaTrace(),
      'charts': (context) => const ChartsPage(),
      'share': (context) => const Share(),
    },
  ));
}
