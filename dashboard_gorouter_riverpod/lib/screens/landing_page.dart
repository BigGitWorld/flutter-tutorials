import 'package:dashboard_gorouter_riverpod/screens/home_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controller/user_controller.dart';
import 'login_page.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const String routeName = "land";
  static const String routeLocation = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: landing View");
    bool loggedIn = ref.read(userProvider);
    return Scaffold(
      appBar: AppBar(
        actions: _actions(context, loggedIn),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("landing page"),
          ],
        ),
      ),
    );
  }

  List<Widget> _actions(BuildContext context, bool loggedIn){
    if(loggedIn){
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).go(HomeContentView.routeLocation),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Username", style: TextStyle(color: Colors.black),),
                Icon(Icons.account_circle, size: 24, color: Colors.black)
              ],
            ),
          ),
        ),
      ];
    }
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () => GoRouter.of(context).push(LoginPage.routeLocation),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Login", style: TextStyle(color: Colors.black),),
              Icon(Icons.login, size: 24, color: Colors.black)
            ],
          ),
        ),
      ),
    ];
  }


}
