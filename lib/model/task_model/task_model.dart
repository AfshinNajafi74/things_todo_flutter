import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? category;
  @HiveField(3)
  DateTime? pickDate;
  @HiveField(4)
  int hour;
  @HiveField(5)
  int minute;
  @HiveField(6)
  int color;
  @HiveField(7)
  int day;
  @HiveField(8)
  bool isDone = false;

  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    required this.pickDate,
    required this.hour,
    required this.minute,
    required this.color,
    required this.day,
    required this.isDone,
  });
}