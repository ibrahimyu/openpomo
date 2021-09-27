import 'package:hive/hive.dart';

part 'difficulty.g.dart';

@HiveType(typeId: 2)
enum Difficulty {
  @HiveField(0)
  easy,

  @HiveField(1)
  normal,

  @HiveField(2)
  hard,

  @HiveField(3)
  intense,
}
