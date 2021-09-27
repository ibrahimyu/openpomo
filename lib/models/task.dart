import 'package:focusplus/models/project.dart';
import 'package:hive/hive.dart';

import 'difficulty.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  dynamic id;

  @HiveField(0)
  String title;

  @HiveField(1)
  String? content;

  @HiveField(2)
  Difficulty difficulty;

  @HiveField(3)
  Project? project;

  @HiveField(4)
  DateTime? createdAt;

  @HiveField(5)
  DateTime? updatedAt;

  @HiveField(6)
  bool done;

  Task({
    this.id,
    required this.title,
    this.content,
    this.difficulty = Difficulty.normal,
    this.project,
    this.done = false,
    this.createdAt,
    this.updatedAt,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      difficulty: map['difficulty'],
      project: map['project'] != null ? Project.fromMap(map['project']) : null,
      done: map['done'],
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'])
          : DateTime.now(),
      updatedAt: map['updated_at'] != null
          ? DateTime.tryParse(map['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
