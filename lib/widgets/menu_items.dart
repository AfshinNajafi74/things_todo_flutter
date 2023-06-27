import 'package:flutter/material.dart';
import 'package:things_todo/model/menu_item_model.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key,required this.onTap,required this.icon,required this.title,required this.selectedMenu,required this.menu,}) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final MenuItem menu;
  final MenuItem selectedMenu;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: selectedMenu == menu ? size.width : 0,
          height: size.height,
          right: 0,
          child: Container(
              color: const Color(0xff7646FF).withOpacity(0.8)
          ),
        ),
        ListTile(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            leading: Icon(icon,color: selectedMenu == menu ? Colors.white : Colors.black),
            horizontalTitleGap: 15,
            title: Text(menu.title,style: TextStyle(color: selectedMenu == menu ? Colors.white : Colors.black),),
            onTap: onTap
        ),
      ],
    );
  }
}

List<MenuItem> sidebarMenus = [
  MenuItem(title: "تسک جدید",icon: Icons.add),
  MenuItem(title: "مهمترین",icon: Icons.star),
  MenuItem(title: "انجام شده",icon: Icons.check),
  MenuItem(title: "خروج",icon: Icons.exit_to_app),
];
