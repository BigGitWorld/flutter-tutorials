import 'package:dashboard_gorouter_riverpod/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home_content_view.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "login";
  static const String routeLocation = "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: login View");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("login page"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ref.read(userProvider.notifier).login();
                GoRouter.of(context).go(HomeContentView.routeLocation);
              },
              child: const Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
