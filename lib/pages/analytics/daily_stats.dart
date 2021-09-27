import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DailyStats extends StatelessWidget {
  DailyStats({Key? key}) : super(key: key);

  final List<FocusTime> chartData = [
    FocusTime(DateTime.parse('2021-09-22'), 35),
    FocusTime(DateTime.parse('2021-09-21'), 28),
    FocusTime(DateTime.parse('2021-09-20'), 34),
    FocusTime(DateTime.parse('2021-09-19'), 32),
    FocusTime(DateTime.parse('2021-09-18'), 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          series: <ChartSeries>[
            // Renders line chart
            LineSeries<FocusTime, DateTime>(
                dataSource: chartData,
                xValueMapper: (FocusTime focus, _) => focus.date,
                yValueMapper: (FocusTime focus, _) => focus.hours)
          ],
        ),
      ),
    );
  }
}

class FocusTime {
  FocusTime(this.date, this.hours);
  final DateTime date;
  final double hours;
}
