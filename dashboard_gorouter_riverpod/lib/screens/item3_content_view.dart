import 'package:flutter/material.dart';
import '../sidebar/sidebar_model.dart';

class Item3ContentView extends StatelessWidget {
  const Item3ContentView({Key? key}) : super(key: key);

  static const String routeName = MenuUtils.sidebarItem3RouteName;
  static const String routeLocation = "/$routeName";

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item3 Content View");
    return const Center(
      child: Text("Item 3 page view"),
    );
  }
}
