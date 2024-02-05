import 'package:aqua_trace/features/Aqua_Trace/widgets/chart.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/topBar.dart';
import 'package:flutter/material.dart';

class AquaTrace extends StatefulWidget {
  const AquaTrace({super.key});

  @override
  State<AquaTrace> createState() => _AquaTraceState();
}

class _AquaTraceState extends State<AquaTrace> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        child: const Column(
          children: [
            SizedBox(height: 60,),
            TopBar(),
            SizedBox(height:60),
            chartWidget()
          ],
        )
      ),
    );;
  }
}