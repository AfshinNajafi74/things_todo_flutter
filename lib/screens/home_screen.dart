import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff7646FF),
        actions: [
          SizedBox(width: 10,),
          Icon(Icons.add,size: 30,),
          SizedBox(width: 5,),
          Icon(Icons.notifications_active,size: 30),
          Spacer(),
          SizedBox(
            width: Get.width / 3.6,
            child: Image.asset("assets/icons/app_logo.png",scale: 1,),
          ),
          Image.asset("assets/icons/menubar.png",scale: 3,),
        ],
      ),
    );
  }
}
