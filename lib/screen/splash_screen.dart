import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import 'package:things_todo/controller/login_controller.dart';
import 'package:things_todo/route/screen_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7)).then((value) {
      if(loginController.userBox.isEmpty){
        Get.offAllNamed(ScreenNames.loginScreen);
      }else {
        Get.offAllNamed(ScreenNames.homeScreen);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset("assets/rive/flutter.riv"),
      ),
    );
  }
}
