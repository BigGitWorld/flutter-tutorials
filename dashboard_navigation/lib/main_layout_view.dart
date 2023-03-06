import 'package:dashboard_navigation/sidebar/sidebar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'appbar/appbar_view.dart';
import 'navigation/content_navigation_view.dart';

class MainLayoutView extends ConsumerWidget {
  const MainLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: MainLayout");
    return Scaffold(
      appBar: customAppBar(ref),
      body: Row(
        children: const [
          Flexible(
              flex: 1,
              child: SidebarView(),
          ),
          Flexible(
            flex: 5,
            child: ContentView(),
          ),
        ],
      ),
    );
  }
}


