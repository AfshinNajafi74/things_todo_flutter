import 'package:flutter/material.dart';

customSnackBar({required BuildContext context, required String content, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content),backgroundColor: color));
}
