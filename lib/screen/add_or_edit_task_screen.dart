import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/component/enum/color_priority.dart';
import 'package:things_todo/controller/tasks_controller.dart';
import 'package:things_todo/route/screen_names.dart';
import 'package:things_todo/widgets/custom_app_bar.dart';
import 'package:things_todo/widgets/radio_color_preference.dart';
import 'package:things_todo/widgets/things_to_do_button.dart';
import '../widgets/app_text_field.dart';

class AddOrEditTaskScreen extends StatefulWidget {
  const AddOrEditTaskScreen({Key? key,this.isEditing = true}) : super(key: key);

  final bool isEditing;

  @override
  State<AddOrEditTaskScreen> createState() => _AddOrEditTaskScreenState();
}

class _AddOrEditTaskScreenState extends State<AddOrEditTaskScreen> {
  final TasksController tasksController = Get.find<TasksController>();
  var getTask = Get.arguments;

  @override
  void initState() {
    if(widget.isEditing == false){
        tasksController.titleController.text = getTask.title;
        tasksController.descriptionController.text = getTask.description;
        tasksController.categoryController.text = getTask.category;
    }
    super.initState();
  }

  @override
  void dispose() {
    tasksController.titleController.clear();
    tasksController.descriptionController.clear();
    tasksController.categoryController.clear();
    tasksController.groupValueCurrent.value = "green";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(tasksController: tasksController.titleController,hintText: "عنوان تـسـک"),
            AppTextField(tasksController: tasksController.descriptionController,hintText: "توضیحات",maxLine: 5),
            AppTextField(tasksController: tasksController.categoryController,hintText: "دسته"),
            _priorityTitle(),
            _colorPriorityRadio(),
            const SizedBox(height: 30,),
            _buttonsSelectTimeDate(context),
            const SizedBox(height: 30,),
            ThingsToDoButton(
              name: widget.isEditing ?  "اضافه کردن" : "ویرایش",
              onPressed: () {
                addOrEditTask();
                tasksController.update();
              },
            ),
            const SizedBox(height: 5,),
          ],
        ),
    ),
    );
  }

  addOrEditTask() {
    if(widget.isEditing == false){
      var id = tasksController.taskBox.values.elementAt(getTask.key);
      if(id.isInBox){
        var value = tasksController.setTaskModel();
        tasksController.taskBox.putAt(getTask.key, value);
      }
      if(id.isDone){
        tasksController.decrement();
      }
    }else {
      tasksController.taskBox.add(
        tasksController.setTaskModel(),
      );
    }
    Get.offNamed(ScreenNames.homeScreen);
  }

  Widget _buttonsSelectTimeDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => tasksController.selectDate(context),
          child:
              const Text('انتخاب تاریخ', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
            child: const Text("انتخاب زمان",
                style: TextStyle(color: Colors.white)),
            onPressed: () => tasksController.timePicker(context)),
      ],
    );
  }

  Widget _priorityTitle() {
    return Container(
        width: double.infinity,
        color: Colors.grey.withOpacity(0.1),
        child: const Padding(
          padding: EdgeInsets.only(bottom: 8.0, top: 8.0, right: 33),
          child: Text(" اولویت"),
        ));
  }

  Widget _colorPriorityRadio() {
    return Column(
      children: [
        RadioColorPreference(
            value: ColorPriority.red.name,
            priorityName: "بالا",
            groupValuesCurrent: tasksController.groupValueCurrent,
            radioColor: Colors.red),
        RadioColorPreference(
          value: ColorPriority.green.name,
          priorityName: "متوسط",
          groupValuesCurrent: tasksController.groupValueCurrent,
          radioColor: Colors.green,
        ),
        RadioColorPreference(
          value: ColorPriority.blue.name,
          priorityName: "کم",
          groupValuesCurrent: tasksController.groupValueCurrent,
          radioColor: Colors.blue,
        ),
      ],
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: Text(widget.isEditing ? "تــسـک جدید" : "ویرایش تــسـک",style: const TextStyle(color: Colors.white),),
      leftButton: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_forward,color: Colors.white,),
      ),
    );
  }
}




