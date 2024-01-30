import 'package:flutter/material.dart';

import 'package:aqua_trace/bottom_navigation.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Blog',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
