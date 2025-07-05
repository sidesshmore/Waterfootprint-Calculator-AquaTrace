import 'dart:developer';

import 'package:aqua_trace/features/Login/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LoginBloc loginbloc = LoginBloc();
  bool _passwordVisible = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void _handleGoogleLogin() async {
    try {
            final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.idToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential credentials =
            await FirebaseAuth.instance.signInWithCredential(credential);
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('uid',credentials.user!.uid);

            Navigator.pushNamed(context, 'aqua_trace');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginbloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) {
        if (state is NavigateToDashboard) {
          Navigator.pushNamed(context, 'aqua_trace');
        } else if (state is NavigateToRegister) {
          Navigator.pushNamed(context, 'register');
        } else if (state is NavigateToErrorState) {
          Navigator.pushNamed(context, 'errors');
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.04, top: screenHeight * 0.17),
                    child: const Text(
                      'AquaTrace',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: screenHeight * 0.06),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.65),
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: screenWidth * 0.80,
                              child: TextField(
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: screenWidth * 0.80,
                              child: TextField(
                                controller: _passwordcontroller,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'forgot_password');
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    const Color.fromARGB(255, 43, 127, 218),
                                  )),
                                  onPressed: () {
                                    loginbloc.add(SignUpButtonClicked(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text));
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          _handleGoogleLogin();
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/google.png"),
                                height: 42,
                                width: 42,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24, right: 8),
                                child: Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          loginbloc.add(NewHereClicked());
                        },
                        child: const Text(
                          'New Here?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
