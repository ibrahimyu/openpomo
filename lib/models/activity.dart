import 'package:hive_flutter/hive_flutter.dart';

part 'activity.g.dart';

@HiveType(typeId: 3)
class Activity {
  int? id;

  @HiveField(0)
  String? comment;

  @HiveField(1)
  DateTime? start;

  @HiveField(2)
  DateTime? end;

  Activity({this.id, this.comment, this.start, this.end});
}
