import 'package:dashboard_gorouter_riverpod/sidebar/sidebar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SidebarView extends ConsumerWidget {
  const SidebarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: Sidebar");
    return Column(
      children: [
        const Icon(
          Icons.pages,
          size: 64,
        ),
        const SizedBox(height: 32),
        ListView(
          shrinkWrap: true,
          children: [
            for (MenuItem item in MenuUtils.menuItems)
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rowItem(context, item),
                  if (item.childs != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: subItems(context, item),
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget subItems(BuildContext context, MenuItem item) {
    return Column(
      children: [
        for (MenuItem child in item.childs!) rowItem(context, child),
      ],
    );
  }

  Widget rowItem(BuildContext context, MenuItem item) {
    return ListTile(
      leading: Icon(item.icon, size: 32),
      title: Text(item.name),
      onTap: () {
        if (item.route == MenuUtils.logoutRouteLocation) {
          logoutDialog(context);
        } else {
          GoRouter.of(context).go(item.route);
        }
      },
    );
  }

  void logoutDialog(BuildContext context) {
    var dialog = AlertDialog(
      title: Text("Logout"),
      content: Text("Do you want to logout?"),
      actions: [
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context)
              ..pop()
              ..go(MenuUtils.logoutRouteLocation);
          },
          child: Text("Yes"),
        ),
        ElevatedButton(
            onPressed: () => Navigator.pop(context), child: Text("No")),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}
