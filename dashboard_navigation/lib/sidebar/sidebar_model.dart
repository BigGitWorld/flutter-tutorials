import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final String route;

  MenuItem(this.name, this.icon, this.route);
}

class MenuUtils {

  static final List<MenuItem> menuItems = [
    MenuItem("Item 1", Icons.dashboard, "/item1"),
    MenuItem("Item 2", Icons.dashboard, "/item2"),
    MenuItem("Item 3", Icons.dashboard, "/item3"),
  ];


}