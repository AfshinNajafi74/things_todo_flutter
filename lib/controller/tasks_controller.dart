import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:things_todo/model/menu_item_model.dart';
import 'package:things_todo/model/task_model/task_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:things_todo/widgets/menu_items.dart';

class TasksController extends GetxController{
  TabController? tabController;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  MenuItem selectedSideMenu = sidebarMenus.first;
  Rx<Jalali> currentDate = Jalali.now().obs;
  Rx<Jalali> selectedDateTime = Jalali.now().obs;
  TimeOfDay selectedTime = TimeOfDay.now();
  int countIsDone = 0;
  final RxString groupValueCurrent = "green".obs;
  var taskBox = Hive.box<TaskModel>("task_box");


  Future<void> selectDate(BuildContext context) async {
    final Jalali? pickedDate = await showPersianDatePicker(
        context: context,
        initialDate: currentDate.value,
        initialDatePickerMode: PDatePickerMode.day,
        firstDate: Jalali(1401, 8),
        lastDate: Jalali(1450, 9),
    ).then((pickedDate) async {
      return  selectedDateTime.value = pickedDate!;
    });
    if(pickedDate != null && pickedDate != currentDate.value) {
      currentDate.value = pickedDate;
    }
   }

  Future<void> timePicker(BuildContext context) async {
    await showPersianTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    ).then((value) {
      selectedTime = value!;
      update();
    });

  }

  @override
  void onInit(){
    readFromHive();
    super.onInit();
  }

  increment() async {
    final countBox = await Hive.openBox('count_box');
    countBox.put('countIsDone', ++countIsDone);
    countBox.close();
    update();
  }
  decrement() async {
    final countBox = await Hive.openBox('count_box');
    countBox.put('countIsDone', --countIsDone);
    countBox.close();
    update();
  }
  clearCountBox() async {
    final countBox = await Hive.openBox('count_box');
    countBox.clear();
  }

  readFromHive() async {
    final countBox = await Hive.openBox('count_box');
    countIsDone =  countBox.get('countIsDone') ?? 0;
    update();
  }

  changeStatusDone(int index) {
    if(taskBox.getAt(index)!.isInBox) {
      taskBox.getAt(index)!.save();
      update();
    }
  }

  setTaskModel() {
    return TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        category: categoryController.text,
        pickDate: currentDate.value.toDateTime(),
        hour: selectedTime.hour,
        minute: selectedTime.minute,
        color: groupValueCurrent.value == "red" ?  const Color(0xffFF3333).value: groupValueCurrent.value == "green" ?  Colors.green.value :  Colors.blue.value,
        day: selectedDateTime.value.day,
        isDone: false
    );
  }

  deleteTask(int index) {
    if(taskBox.getAt(index)!.isDone){
      decrement();
    }
    taskBox.deleteAt(index);
    update();
    Get.back();
  }
}