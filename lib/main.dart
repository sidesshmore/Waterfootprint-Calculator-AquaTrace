import 'package:aqua_trace/features/Blog/ui/blog.dart';
import 'package:aqua_trace/features/Charts/ui/charts.dart';
import 'package:aqua_trace/TestWidgets/error.dart';
import 'package:aqua_trace/TestWidgets/successful.dart';
import 'package:aqua_trace/features/Forgot_Password/forgotPassword.dart';
import 'package:aqua_trace/features/Login/ui/login.dart';
import 'package:aqua_trace/features/NavigationBar/ui/navigation_bar.dart';

import 'package:aqua_trace/features/Profile_Screen/ui/side.dart';
import 'package:aqua_trace/features/Register/ui/register.dart';
import 'package:aqua_trace/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/ui/leaderboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("25dc09a3-67df-410c-9249-e21966c9d262");

  OneSignal.Notifications.requestPermission(true);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final uid = prefs.getString('uid');
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    // theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,

    initialRoute: uid == null ? 'login' : 'aqua_trace',
    routes: {
      'login': (context) => const Login(),
      'register': (context) => const Register(),
      'forgot_password': (context) => const ForgotPassWord(),
      'success': (context) => const Success(),
      'errors': (context) => const ErrorScreen(),
      'profile': (context) => const ProfilePage(),
      'blog': (context) => const BlogPage(),
      'aqua_trace': (context) => ShowCaseWidget(
          builder: Builder(builder: (context) => CustomNavigationBar())),
      'charts': (context) => const ChartsPage(),
      'share': (context) => LeaderboardScreen(),
    },
  ));
}
