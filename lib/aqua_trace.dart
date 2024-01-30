import 'package:flutter/material.dart';
import 'package:aqua_trace/bottom_navigation.dart';

class AquaTrace extends StatelessWidget {
  const AquaTrace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'AquaTrace',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
