import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:things_todo/model/user_model/user_model.dart';

class LoginController extends GetxController{
  TextEditingController userNameController = TextEditingController();
  var userBox = Hive.box<UserModel>("user_box");
}