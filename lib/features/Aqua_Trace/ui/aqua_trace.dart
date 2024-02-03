import 'package:flutter/material.dart';

class AquaTrace extends StatelessWidget {
  const AquaTrace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'WATER FOOTPRINT',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //       fontSize: 25.5,
      //     ),
      //   ),
      //   backgroundColor: Color.fromARGB(255, 24, 94, 247),
      //   centerTitle: true,
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(100),
      //     bottomLeft: Radius.circular(100),
      //   )),
      //   toolbarHeight: 75,
      // ),
      body: Container(
        child: const Center(
          child: Text(
            'AquaTrace',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
