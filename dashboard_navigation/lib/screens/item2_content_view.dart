import 'package:flutter/material.dart';

class Item2ContentView extends StatelessWidget {
  const Item2ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item2 Content View");
    return const Center(
      child: Text("Item 2 page view"),
    );
  }
}
