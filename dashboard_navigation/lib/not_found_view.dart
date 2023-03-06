import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("build::: Not Found View");
    return const Center(
      child: Text("404 Not Found"),
    );
  }
}
