import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioColorPreference extends StatelessWidget {
  const RadioColorPreference({
    super.key,
    required RxString groupValuesCurrent,
    required this.priorityName,
    required this.value,
    required this.radioColor,
  }) : groupValues = groupValuesCurrent;

  final RxString groupValues;
  final String priorityName;
  final String value;
  final Color radioColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  RadioListTile(
        selected: true,
        fillColor: MaterialStatePropertyAll<Color>(radioColor),
        title: Text(priorityName),
        activeColor: radioColor,
        value: value,
        groupValue: groupValues.value,
        onChanged: (value) {
          groupValues.value = value!;
        },
      ),
    );
  }
}
