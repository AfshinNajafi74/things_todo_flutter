import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/controller/file_picker_controller.dart';
import 'package:things_todo/controller/tasks_controller.dart';
import 'package:things_todo/route/screen_names.dart';
import 'package:things_todo/screen/home_daily_screen.dart';
import 'package:things_todo/screen/home_monthly_screen.dart';
import 'package:things_todo/screen/home_weekly_screen.dart';
import 'package:things_todo/screen/splash_screen.dart';
import 'package:things_todo/widgets/app_text_field.dart';
import 'package:things_todo/widgets/custom_app_bar.dart';
import 'package:things_todo/widgets/custom_show_dialog.dart';
import 'package:things_todo/widgets/menu_items.dart';
import '../controller/login_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  FilePickerController filePickerController = Get.find<FilePickerController>();
  TasksController tasksController = Get.find<TasksController>();
  LoginController loginController = Get.find<LoginController>();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tasksController.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      appBar: _appBar(),
      endDrawer: _drawer(size, context), //Drawer,
      body: Column(
        children: [
          /// search box
          _searchTask(),
          /// tab bar
          _tabBar(),
          /// tab bar's children
          _tabBarChildren()
        ],
      ),
    );
  }

  Widget _tabBarChildren() {
    return Expanded(
        child: TabBarView(
      controller: tasksController.tabController,
      children: [ HomeDailyScreen(), HomeWeeklyScreen(), const HomeMonthlyScreen()],
    ));
  }

  Widget _tabBar() {
    return Container(
      height: Get.height / 12.05,
      decoration: BoxDecoration(
          color: const Color(0xff7646FF),
          border: Border.all(color: const Color(0xff7646FF))),
      child: TabBar(
          indicatorColor: Colors.transparent,
          controller: tasksController.tabController,
          labelColor: Colors.white,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: "روزانه",
            ),
            Tab(
              text: "هفتگی",
            ),
            Tab(
              text: "ماهانه",
            ),
          ]),
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      leading: IconButton(
          onPressed: () {
            Get.toNamed(ScreenNames.addOrEditTaskScreen);
          },
          icon: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          )),
      leftButton: InkWell(
          onTap: () {
            scaffoldState.currentState!.openEndDrawer();
          },
          child: Image.asset(
            "assets/icons/menubar.png",
            scale: 3,
          )),
      title: SizedBox(
        width: Get.width / 3.6,
        child: Image.asset(
          "assets/icons/app_logo.png",
        ),
      ),
      sizedBox: const SizedBox(
        width: 8,
      ),
    );
  }

  Widget _searchTask() {
    return Container(
      color: const Color(0xff7646FF),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AppTextField(tasksController: tasksController.searchController, hintText: "جستجوی تسک"),
      ),
    );
  }

  Widget _drawer(Size size, BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
          children: [
        GetBuilder<FilePickerController>(
        init: FilePickerController(),
        builder: (FilePickerController controller) {
          return DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xff7646FF)),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: _profile(size),
          );
        },
      ),
      ...listTile(context)
    ]));
  }

  Iterable<Widget> listTile(BuildContext context) {
    return sidebarMenus.map((menu) => GetBuilder(
      builder: (TasksController tasksController) {
        return MenuItems(
          menu: menu,
          selectedMenu: tasksController.selectedSideMenu,
          title: menu.title,
          icon: menu.icon,
          onTap: () async {
            tasksController.selectedSideMenu = menu;
            tasksController.update();
            switch (menu.title) {
              case "تسک جدید":
                print("new task");
                break;
              case "مهمترین":
                print("the most important");
                break;
              case "انجام شده":
                print("done");
                break;
              case "خروج":
                customShowDialog(
                  context: context,
                  title: "خروج",
                  onPressed: () {
                    loginController.userBox.clear();
                    tasksController.taskBox.clear();
                    tasksController.clearCountBox();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                            (route) => false);
                  },
                );
                break;
            }
          },
        );
      },
    ));
  }

  Widget _profile(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipOval(
          child: SizedBox(
            width: size.width * 0.30,
            height: size.width * 0.30,
            child: Image.file(
              File(loginController.userBox.getAt(0)!.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(loginController.userBox.getAt(0)!.name)
      ],
    );
  }
}
