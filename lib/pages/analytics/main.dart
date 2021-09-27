import 'package:flutter/material.dart';
import 'package:focusplus/pages/analytics/daily_stats.dart';
import 'package:focusplus/pages/analytics/productive_time.dart';
import 'package:focusplus/styles.dart';
import 'package:focusplus/widgets/counter_box.dart';
import 'package:get/get.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(8.0),
      children: [
        const ListTile(
          title: Text('Tasks Summary', style: Styles.listHeader),
        ),
        LayoutBuilder(
          builder: (context, contraint) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: (Get.size.width / 180).round(),
              padding: const EdgeInsets.all(8.0),
              children: const [
                CounterBox(title: 'Tasks Done', value: '15'),
                CounterBox(title: 'New Tasks', value: '15'),
                CounterBox(title: 'Planned Tomorrow', value: '15'),
              ],
            );
          },
        ),
        const ListTile(
          title: Text('Learning Summary', style: Styles.listHeader),
        ),
        LayoutBuilder(
          builder: (context, contraint) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: (Get.size.width / 180).round(),
              padding: const EdgeInsets.all(8.0),
              children: const [
                CounterBox(title: 'Things Learned', value: '15'),
                CounterBox(title: 'Ideas', value: '15'),
                CounterBox(title: 'Planned Tomorrow', value: '15'),
              ],
            );
          },
        ),
        const ListTile(
          title: Text('Daily Stats', style: Styles.listHeader),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DailyStats(),
        ),
        const ListTile(
          title: Text('Productive Time', style: Styles.listHeader),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductiveTime(),
        ),
      ],
    );
  }
}
