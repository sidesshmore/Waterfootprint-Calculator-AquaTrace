import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Charts',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
