import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePoint extends StatelessWidget {
  final Widget? content;
  final DateTime? stamp;
  final IndicatorStyle? indicatorStyle;

  const TimelinePoint({
    Key? key,
    this.content,
    this.stamp,
    this.indicatorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      startChild: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: content,
              // Text('Adding feature to form and fixed minor bugs'),
            ),
          ),
          if (stamp != null)
            Text(
              stamp!.toIso8601String(),
              style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
      indicatorStyle: indicatorStyle ?? const IndicatorStyle(width: 25),
      /*IndicatorStyle(
        width: 40,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: Icons.insert_emoticon,
        ),
      ),*/
    );
  }
}
