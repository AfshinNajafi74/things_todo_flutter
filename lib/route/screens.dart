import 'package:get/get.dart';
import 'package:things_todo/controller/bindings.dart';
import 'package:things_todo/route/screen_names.dart';
import 'package:things_todo/screen/add_or_edit_task_screen.dart';
import 'package:things_todo/screen/home_daily_screen.dart';
import 'package:things_todo/screen/home_monthly_screen.dart';
import 'package:things_todo/screen/home_screen.dart';
import 'package:things_todo/screen/home_weekly_screen.dart';
import 'package:things_todo/screen/login_screen.dart';
import 'package:things_todo/screen/splash_screen.dart';

class Screens{
  Screens._();

  static List<GetPage<dynamic>> routes = [
    GetPage(name: ScreenNames.route, page: () => const SplashScreen(),binding: LoginBindings()),
    GetPage(name: ScreenNames.loginScreen, page: () =>  LoginScreen(),bindings: [LoginBindings(),FilePickerBindings()]),
    GetPage(name: ScreenNames.homeScreen, page: () => const HomeScreen(),bindings: [FilePickerBindings(),TaskBindings(),LoginBindings(),WeeklyBindings()]),
    GetPage(name: ScreenNames.addOrEditTaskScreen, page: () => const AddOrEditTaskScreen(),binding: TaskBindings()),
    GetPage(name: ScreenNames.homeDailyScreen, page: () =>  HomeDailyScreen(),bindings: [LoginBindings()]),
    GetPage(name: ScreenNames.homeWeeklyScreen, page: () =>  HomeWeeklyScreen(),binding: WeeklyBindings()),
    GetPage(name: ScreenNames.homeMonthlyScreen, page: () => const HomeMonthlyScreen(),),
  ];
}