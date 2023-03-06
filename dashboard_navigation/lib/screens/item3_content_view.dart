import 'package:flutter/material.dart';

class Item3ContentView extends StatelessWidget {
  const Item3ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item3 Content View");
    return const Center(
      child: Text("Item 3 page view"),
    );
  }
}
