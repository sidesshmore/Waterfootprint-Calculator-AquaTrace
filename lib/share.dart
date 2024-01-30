import 'package:flutter/material.dart';

import 'package:aqua_trace/bottom_navigation.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Share',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
