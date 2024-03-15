import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class chartWidget extends StatefulWidget {
  const chartWidget({required this.total,super.key});

  final double total;

  @override
  State<chartWidget> createState() => _chartWidgetState();
}

class _chartWidgetState extends State<chartWidget> {

  

  @override
  Widget build(BuildContext context) {
    double c_total=widget.total;
    double percent=c_total/3800;
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 800,
      radius: 140,
      lineWidth: 35,
      percent: min(percent,1),
      progressColor:  percent<1 ? Colors.blue.shade700:Colors.red.shade300,
      backgroundColor: Colors.blue.shade100,
      circularStrokeCap: CircularStrokeCap.round,
      center:  Column(
        children: [
          SizedBox(height: 60),
          Icon(Icons.water_drop,
              color: Color.fromARGB(255, 24, 94, 247), size: 70),
          SizedBox(height: 10),
          Text('${c_total.toInt()}Litres',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
          // const SizedBox(height:2),
          Text(
            'water used',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
