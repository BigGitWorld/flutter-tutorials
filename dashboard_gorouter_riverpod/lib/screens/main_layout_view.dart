import 'package:dashboard_gorouter_riverpod/screens/item1_content_view.dart';
import 'package:dashboard_gorouter_riverpod/sidebar/sidebar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLayoutView extends ConsumerWidget {
  const MainLayoutView({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: MainLayout");
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true,),
      body: Row(
        children: [
          const Flexible(
              flex: 1,
              child: SidebarView(),
          ),
          Flexible(
            flex: 5,
            child: body,
          ),
        ],
      ),
    );
  }
}


