import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles:
                SideTitles(reservedSize: 40, showTitles: true, interval: 1000),
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
              const FlSpot(1, 1400),
              const FlSpot(2, 1900),
              const FlSpot(3, 2400),
              const FlSpot(4, 3300),
              const FlSpot(5, 2800),
              const FlSpot(6, 2100),
              const FlSpot(7, 1950),
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
}
