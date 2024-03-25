import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class chartWidget extends StatefulWidget {
  const chartWidget(
      {required this.total, required this.list_length, super.key});

  final int list_length;
  final double total;

  @override
  State<chartWidget> createState() => _chartWidgetState();
}

class _chartWidgetState extends State<chartWidget> {
  @override
  Widget build(BuildContext context) {
    double c_total = widget.list_length == 0 ? 0 : widget.total;
    double percent = (3800 - c_total) / 3800;
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      animation: true,
      animationDuration: 800,
      radius: 140,
      lineWidth: 35,
      percent: max(percent, 0),
      progressColor: percent >= 0.75
          ? Colors.blue.shade700
          : percent >= 0.50
              ? Colors.blue.shade500
              : percent >= 0.25
                  ? Colors.orangeAccent
                  : Colors.red,
      backgroundColor: Colors.blue.shade100,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        children: [
          const SizedBox(height: 60),
          const Icon(Icons.water_drop,
              color: Color.fromARGB(255, 24, 94, 247), size: 70),
          const SizedBox(height: 10),
          (3800 - c_total.toInt()) <= 0
              ? Text('${3800 - c_total.toInt()}Litres',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.red))
              : Text('${3800 - c_total.toInt()}Litres',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
          (3800 - c_total.toInt()) <= 0
              ?
              // const SizedBox(height:2),
              const Text(
                  'Extra water used',
                  style: TextStyle(fontSize: 16),
                )
              : const Text(
                  'Water Remaining',
                  style: TextStyle(fontSize: 16),
                )
        ],
      ),
    );
  }
}
