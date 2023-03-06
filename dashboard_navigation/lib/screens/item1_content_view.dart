import 'package:flutter/material.dart';

class Item1ContentView extends StatelessWidget {
  const Item1ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Item1 Content View");
    return const Center(
      child: Text("Item 1 page view"),
    );
  }
}
