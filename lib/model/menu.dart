// menu.dart

import 'package:rive_animated_icon/rive_animated_icon.dart';

class Menu {
  final String title;
  final RiveIcon riveIcon;

  Menu({required this.title, required this.riveIcon});
}

List<Menu> sidebarMenus = [
  Menu(title: "Home", riveIcon: RiveIcon.home),
  Menu(title: "Search", riveIcon: RiveIcon.search),
  Menu(title: "Favorites", riveIcon: RiveIcon.star),
];

List<Menu> sidebarMenus2 = [
  Menu(title: "History", riveIcon: RiveIcon.timer),
];

List<Menu> bottomNavItems = [
  Menu(title: "Search", riveIcon: RiveIcon.search),
  Menu(title: "Timer", riveIcon: RiveIcon.timer),
  Menu(title: "Profile", riveIcon: RiveIcon.profile),
];