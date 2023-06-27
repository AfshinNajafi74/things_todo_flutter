import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/controller/file_picker_controller.dart';
import 'package:things_todo/controller/login_controller.dart';
import 'package:things_todo/model/user_model/user_model.dart';
import 'package:things_todo/route/screen_names.dart';
import 'package:things_todo/widgets/app_text_field.dart';
import 'package:things_todo/widgets/things_to_do_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.find<LoginController>();
  final FilePickerController filePickerController = Get.find<FilePickerController>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// logo
                Image.asset("assets/icons/Logo.png",width: Get.width * 0.40,),
                GetBuilder<FilePickerController>(
                  init: FilePickerController(),
                  builder: (FilePickerController filePickerController) {
                    return Stack(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: Image(
                                  image: filePickerController.newImage == null ?
                                  Image.asset("assets/images/no_picture.png").image :
                                  Image.file(
                                    File(filePickerController.newImage!.path),
                                  ).image
                              ).image,
                              width: Get.width * 0.46,
                              height: Get.height * 0.22,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 6,
                            child: GestureDetector(
                              onTap: () async {
                                await filePickerController.getImage();
                              },
                              child: ClipOval(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: const Color(0xff6035D0),
                                  child: const Icon(Icons.add,color: Colors.white,),
                                ),
                              ),
                            )
                        )
                      ],
                    );
                  },
                ),
                /// text fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    children: [
                      AppTextField(hintText: "نام کاربری",tasksController: loginController.userNameController,prefixIcon: const Icon(Icons.person_outline,),
                ),
                      const SizedBox(height: 30,),
                      /// login btn
                      ThingsToDoButton(
                          name: "برو بریم",
                          onPressed: () {
                            loginController.userBox.add(UserModel(name: loginController.userNameController.text, image: filePickerController.newImage!.path));
                            loginController.userNameController.clear();
                            Get.offAllNamed(ScreenNames.homeScreen);
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}

