import 'package:flutter/material.dart';

Future<void> customShowDialog({required BuildContext context, required String title, required VoidCallback onPressed}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(title == "حذف کردن" ? "مطمئنی میخوای این تسک رو حذف کنی؟" : "مطمئنی میخوای از اپلیکیشن خارج بشی ؟"),
          actions: [
            TextButton(
                onPressed: onPressed,
                child: const Text("بلی")
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text("خیر")
            )
          ],
        );
      }
  );
}
