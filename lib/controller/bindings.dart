import 'package:get/get.dart';
import 'package:things_todo/controller/file_picker_controller.dart';
import 'package:things_todo/controller/login_controller.dart';
import 'package:things_todo/controller/tasks_controller.dart';
import 'package:things_todo/controller/weekly_controller.dart';

class LoginBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
class TaskBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(TasksController());
  }
}

class FilePickerBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(FilePickerController());
  }
}

class WeeklyBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WeeklyController());
  }
}