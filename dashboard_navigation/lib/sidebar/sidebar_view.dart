import 'package:dashboard_navigation/sidebar/sidebar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation/navigation_state.dart';

class SidebarView extends ConsumerWidget {
  const SidebarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: Sidebar");
    return Column(
      children: [
        const Icon(Icons.pages, size: 64,),
        const SizedBox(height: 32),
        ListView(
          shrinkWrap: true,
          children: [
            for(MenuItem item in MenuUtils.menuItems)
              ListTile(
                leading: Icon(item.icon, size: 32),
                title: Text(item.name),
                onTap: (){
                  ref.read(navigationProvider.notifier).setActivePage(item.route);
                },
              ),
          ],
        ),
      ],
    );
  }
}
