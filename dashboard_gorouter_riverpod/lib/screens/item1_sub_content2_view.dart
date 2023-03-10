import 'package:dashboard_gorouter_riverpod/sidebar/sidebar_model.dart';
import 'package:flutter/material.dart';

class Item1SubContent2View extends StatelessWidget {
  const Item1SubContent2View({Key? key}) : super(key: key);

  static const String routeName = "b";
  static const String routeLocation = "/$routeName";

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item1 sub Content 2 View");
    return const Center(
      child: Text("Item 1 sub content 2 view"),
    );
  }
}
