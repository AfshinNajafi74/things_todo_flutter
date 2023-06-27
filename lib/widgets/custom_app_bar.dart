import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading = const SizedBox(),
    required this.leftButton,
    required this.title,
    this.sizedBox = const SizedBox(width: 0,),
  });
  final Widget leading;
  final Widget leftButton;
  final Widget title;
  final SizedBox sizedBox;

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return AppBar(
      excludeHeaderSemantics: false,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff7646FF),
      actions: [
        leading,
        const Spacer(),
        title,
        const SizedBox(width: 20,),
        SizedBox(width: size.width * 0.12,child: leftButton),
        sizedBox
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
