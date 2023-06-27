import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
   const AppTextField({
    super.key,
    required this.tasksController,
    required this.hintText,
    this.maxLine = 1,
    this.prefixIcon = const SizedBox.shrink(),
  });

  final String hintText;
  final int maxLine;
  final TextEditingController tasksController;
  final Widget prefixIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if(value == null || value.isEmpty ) {
            return "عزیزوم فیلد مورد نظرو رو پر کن";
          }
          return null;
        },
        maxLines: maxLine,
        controller: tasksController,
        decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff707070)),
          suffixIcon: prefixIcon,
          suffixIconColor: Colors.grey,
        ),
      ),
    );
  }
}
