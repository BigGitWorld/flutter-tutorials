import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final String route;
  final List<MenuItem>? childs;

  MenuItem(this.name, this.icon, this.route, {this.childs});
}

class MenuUtils {

  static const sidebarHomeRouteName = "home";
  static const sidebarItem1RouteName = "item1";
  static const sidebarItem2RouteName = "item2";
  static const sidebarItem3RouteName = "item3";
  static const logoutRouteLocation = "/logout";

  static final List<MenuItem> menuItems = [
    MenuItem("Home", Icons.home, "/$sidebarHomeRouteName"),
    MenuItem("Item 1", Icons.dashboard, "/$sidebarItem1RouteName",
        childs: [
          MenuItem("sub 1", Icons.dashboard, "/$sidebarItem1RouteName/a"),
          MenuItem("sub 2", Icons.dashboard, "/$sidebarItem1RouteName/b"),
        ],
    ),
    MenuItem("Item 2", Icons.dashboard, "/$sidebarItem2RouteName"),
    MenuItem("Item 3", Icons.dashboard, "/$sidebarItem3RouteName"),
    MenuItem("Logout", Icons.logout, logoutRouteLocation),
  ];


}