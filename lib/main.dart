import 'package:aqua_trace/features/Blog/ui/blog.dart';
import 'package:aqua_trace/features/Charts/ui/charts.dart';
import 'package:aqua_trace/TestWidgets/error.dart';
import 'package:aqua_trace/TestWidgets/successful.dart';
import 'package:aqua_trace/features/Login/ui/login.dart';
import 'package:aqua_trace/features/NavigationBar/ui/navigation_bar.dart';
import 'package:aqua_trace/features/Profile_Screen/ui/profile_page.dart';
import 'package:aqua_trace/features/Register/ui/register.dart';
import 'package:aqua_trace/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aqua_trace/features/Share_Screen/ui/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    // theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'success': (context) => const Success(),
      'errors': (context) => const ErrorScreen(),
      'profile': (context) => const ProfilePage(),
      'blog': (context) => const BlogPage(),
      'aqua_trace': (context) => const CustomNavigationBar(),
      'charts': (context) => const ChartsPage(),
      'share': (context) => ShareScreen(),
    },
  ));
}
