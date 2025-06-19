// side_menu.dart

import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

import '../../../model/menu.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.selectedMenu,
  });

  final Menu menu;
  final VoidCallback press;
  // Although the new package handles its own initialization,
  // the widget signature still requires a callback.
  final ValueChanged<dynamic> riveOnInit;
  final Menu selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: selectedMenu == menu ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimatedIcon(
                  riveIcon: menu.riveIcon,
                  width: 36,
                  height: 36,
                  color: Colors.white,
                  strokeWidth: 2,
                  loopAnimation: false,
                  // Since the new package handles initialization internally,
                  // a dummy callback is provided; adjust if necessary.
                  onTap: () {},
                  onHover: (hovering) {},
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}