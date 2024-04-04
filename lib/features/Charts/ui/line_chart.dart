import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List weekData = [];

  Future<String> getList() async {
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio.get('${dotenv.env["URL"]}/week/${uid}');
    if (response.statusCode == 200) {
      final data = response.data['weekData'];
      for (int i = 0; i < 7; i++) {
        weekData.add(double.parse(data[i].toString()));
      }
      log(weekData.toString());
      log(weekData.runtimeType.toString());
      return "Data Loaded";
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Day1';
              break;
            case 2:
              text = 'Day2';
              break;
            case 3:
              text = 'Day3';
              break;
            case 4:
              text = 'Day4';
              break;
            case 5:
              text = 'Day5';
              break;
            case 6:
              text = 'Day6';
              break;
            case 7:
              text = 'Day7';
              break;
          }

          return Text(text);
        },
      );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (weekData.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                        reservedSize: 40, showTitles: true, interval: 1000),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                ),
                backgroundColor: Colors.black,
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                minX: 0,
                maxX: 7,
                minY: 0,
                maxY: 3800,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(1, weekData[0]),
                      FlSpot(2, weekData[1]),
                      FlSpot(3, weekData[2]),
                      FlSpot(4, weekData[3]),
                      FlSpot(5, weekData[4]),
                      FlSpot(6, weekData[5]),
                      FlSpot(7, weekData[6]),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(colors: gradientColors),
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
