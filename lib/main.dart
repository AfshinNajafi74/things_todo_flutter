import 'package:flutter/material.dart';
import 'package:things_todo/model/task_model/task_model.dart';
import 'package:things_todo/model/user_model/user_model.dart';
import 'package:things_todo/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>("task_box");
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>("user_box");
  runApp(const MyApp());
}



