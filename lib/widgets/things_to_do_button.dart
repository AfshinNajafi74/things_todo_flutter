import 'package:flutter/material.dart';

class ThingsToDoButton extends StatelessWidget {
  const ThingsToDoButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff6035D0),
          fixedSize: const Size(292, 55)
      ),
      child:  Text(name,style: const TextStyle(fontFamily: "vazir",fontSize: 24,color: Colors.white),),
    );
  }
}
