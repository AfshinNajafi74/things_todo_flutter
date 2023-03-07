import 'package:flutter/material.dart';
import 'package:things_todo/main_screen.dart';
import 'package:things_todo/screens/home_screen.dart';
import 'package:things_todo/screens/login_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("fa"),
      home: HomeScreen(),
    );
  }
}
