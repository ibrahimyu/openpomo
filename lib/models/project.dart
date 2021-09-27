import 'package:focusplus/models/task.dart';
import 'package:hive/hive.dart';

part 'project.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  int? id;

  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<Task>? tasks;

  Project({
    this.id,
    required this.name,
    this.tasks,
  }) {
    tasks ??= HiveList(Hive.box<Task>('tasks'));
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
