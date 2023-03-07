import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xff7646FF),
        leading: Icon(Icons.notifications_active_outlined,size: 30),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text("تسک جدید")
          ),
          SizedBox(width: 10,),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_forward)),
          SizedBox(width: 5,)
        ],
      ),
    );
  }
}
