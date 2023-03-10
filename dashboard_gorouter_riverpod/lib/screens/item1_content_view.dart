import 'package:dashboard_gorouter_riverpod/sidebar/sidebar_model.dart';
import 'package:flutter/material.dart';

class Item1ContentView extends StatelessWidget {
  const Item1ContentView({Key? key}) : super(key: key);

  static const String routeName = MenuUtils.sidebarItem1RouteName;
  static const String routeLocation = "/$routeName";

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item1 Content View");
    return const Center(
      child: Text("Item 1 page view"),
    );
  }
}
