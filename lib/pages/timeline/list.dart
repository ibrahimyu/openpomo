import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        controller: ScrollController(),
        children: [
          TimelineTile(
            alignment: TimelineAlign.center,
            startChild: Column(
              children: [
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Adding feature to form and fixed minor bugs'),
                )),
                Text('5m', style: TextStyle(color: Colors.grey)),
              ],
            ),
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: Colors.purple,
              padding: const EdgeInsets.all(8),
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.insert_emoticon,
              ),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.center,
            endChild: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belajar'),
                  Text('5 menit yang lalu'),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: Colors.green,
              padding: const EdgeInsets.all(8),
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.check,
              ),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.center,
            startChild: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belajar'),
                  Text('5 menit yang lalu'),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
              iconStyle: IconStyle(
                color: Colors.white,
                iconData: Icons.bookmark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
