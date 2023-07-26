import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:things_todo/component/extensions.dart';
import 'package:things_todo/controller/login_controller.dart';
import 'package:things_todo/controller/tasks_controller.dart';
import 'package:things_todo/screen/add_or_edit_task_screen.dart';
import 'package:things_todo/widgets/custom_show_dialog.dart';


class HomeDailyScreen extends StatefulWidget  {
  HomeDailyScreen({super.key});

  @override
  State<HomeDailyScreen> createState() => _HomeDailyScreenState();
}

class _HomeDailyScreenState extends State<HomeDailyScreen> with SingleTickerProviderStateMixin{
  final LoginController loginController = Get.find<LoginController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),
      body: Column(
        children: [
          /// display information of all today's tasks
          _dashboard(),
          /// list of task's card
          Expanded(
            child: GetBuilder<TasksController>(
              init: TasksController(),
              builder: (TasksController tasksController) {
                return ListView.builder(
                    itemCount: tasksController.taskBox.length,
                    itemBuilder: (context, index) {
                      // if(tasksController.myTask[index].day == Jalali.now().day){
                      return _taskCard(tasksController, index, context);
                    }
                  );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _taskCard( TasksController tasksController, int index, BuildContext context) {
    return Card(
      color: Color(tasksController.taskBox.getAt(index)!.isDone
          ? Colors.grey.value
          : Colors.white.value),
      shadowColor: const Color(0xff7646FF),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          textColor: Colors.black,
          title: Text(tasksController.taskBox.getAt(index)!.title!,
              overflow: TextOverflow.ellipsis),
          subtitle: Text(
            tasksController.taskBox.getAt(index)!.category!,
            overflow: TextOverflow.ellipsis,
          ),
          leading: SizedBox(
            width: Get.width / 5.2,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _priorityColorContainer(tasksController, index),
                starButtonToChangeStatus(tasksController, index)
              ],
            ),
          ),
          trailing: _scheduling(tasksController, index),
          children: [
            _deleteOrEdit(context, tasksController, index)
          ],
        ),
      ),
    );
  }

  Widget _deleteOrEdit(BuildContext context, TasksController tasksController, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              customShowDialog(
                context: context,
                title: "حذف کردن",
                onPressed: () {
                  tasksController.deleteTask(index);
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Color(0xff7646FF),
            )),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: () {
              Get.to(() => const AddOrEditTaskScreen(isEditing: false,),arguments: tasksController.taskBox.values.elementAt(index));
            },
            icon: const Icon(
              Icons.edit_document,
              color: Color(0xff7646FF),
            )),
      ],
    );
  }

  Widget _scheduling(TasksController tasksController, int index) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
            "${tasksController.taskBox.getAt(index)!.minute.toString().padLeft(2, "0")} : ${tasksController.taskBox.getAt(index)!.hour.toString().padLeft(2, "0")}"),
        const SizedBox(height: 4),
        Text(tasksController.taskBox.getAt(index)!.hour < 12 ? "ق.ظ" : "ب.ظ"),
      ],
    );
  }

  Widget starButtonToChangeStatus(TasksController tasksController, int index) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation,child: child);
      },
      child: IconButton(
          key: ValueKey<bool>(tasksController.taskBox.getAt(index)!.isDone),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            tasksController.changeStatusDone(index);
            tasksController.taskBox.getAt(index)!.isDone =
            tasksController.taskBox.getAt(index)!.isDone ? false : true;
            if (tasksController.taskBox.getAt(index)!.isDone) {
              tasksController.increment();
            } else {
              tasksController.decrement();
            }
          },
          icon: Icon(
            tasksController.taskBox.getAt(index)!.isDone
                ? Icons.star
                : Icons.star_outline,
            color: tasksController.taskBox.getAt(index)!.isDone
                ? const Color(0xffFFD700)
                : Colors.grey,
          )),
    );
  }
  Widget _priorityColorContainer(TasksController tasksController, int index) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(tasksController.taskBox.getAt(index)!.color)),
    );
  }

  Widget _dashboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        height: Get.height / 5.6,
        width: Get.width / 1.09,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xff7646FF),
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ســـــلام ${loginController.userBox.getAt(0)!.name}"),
              const SizedBox(
                height: 8.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "امروز",
                    style: TextStyle(color: Color(0xff7646FF)),
                  ),
                  Text("تکمیل شده", style: TextStyle(color: Color(0xff4CD964))),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              GetBuilder<TasksController>(
                init: TasksController(),
                builder: (controller) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${Jalali.now()}".todayDataCustomFormat()),
                      const Spacer(),
                      Text(
                        controller.countIsDone.toString(),
                        style: const TextStyle(color: Colors.green),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("/"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(controller.taskBox.length.toString(),
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
