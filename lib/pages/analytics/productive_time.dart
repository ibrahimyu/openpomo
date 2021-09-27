import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductiveTime extends StatelessWidget {
  ProductiveTime({Key? key}) : super(key: key);

  final List<FocusTime> chartData = [
    FocusTime(0, 0),
    FocusTime(1, 0),
    FocusTime(2, 0),
    FocusTime(3, 0),
    FocusTime(4, 0),
    FocusTime(5, 0),
    FocusTime(6, 0),
    FocusTime(7, 4),
    FocusTime(8, 35),
    FocusTime(9, 28),
    FocusTime(10, 34),
    FocusTime(11, 32),
    FocusTime(12, 40),
    FocusTime(13, 30),
    FocusTime(14, 24),
    FocusTime(15, 18),
    FocusTime(16, 3),
    FocusTime(17, 0),
    FocusTime(18, 0),
    FocusTime(19, 0),
    FocusTime(20, 0),
    FocusTime(21, 0),
    FocusTime(22, 0),
    FocusTime(23, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            // Renders line chart
            ColumnSeries<FocusTime, int>(
                dataSource: chartData,
                xValueMapper: (FocusTime focus, _) => focus.timeOfDay,
                yValueMapper: (FocusTime focus, _) => focus.hours)
          ],
        ),
      ),
    );
  }
}

class FocusTime {
  FocusTime(this.timeOfDay, this.hours);
  final int timeOfDay;
  final double hours;
}
