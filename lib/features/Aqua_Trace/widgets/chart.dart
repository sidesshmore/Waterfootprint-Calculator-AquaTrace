import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class chartWidget extends StatefulWidget {
  const chartWidget({super.key});

  @override
  State<chartWidget> createState() => _chartWidgetState();
}

class _chartWidgetState extends State<chartWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 800,
      radius: 140,
      lineWidth: 35,
      percent: 0.65,
      progressColor: Colors.blue.shade700,
      backgroundColor: Colors.blue.shade100,
      circularStrokeCap: CircularStrokeCap.round,
      center: const Column(
        children: [
           SizedBox(height:60),
           Icon(Icons.water_drop,color:  Color.fromRGBO(52,104,192,1),size: 70),
           SizedBox(height:10),
          Text('1356 Litres',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500)),
          // const SizedBox(height:2),
          Text('water used',style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}