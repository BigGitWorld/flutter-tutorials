import 'package:dashboard_gorouter_riverpod/screens/main_layout_view.dart';
import 'package:dashboard_gorouter_riverpod/navigation/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: MyApp");
    var goRouter = ref.watch(goRouteProvider);
    return MaterialApp.router(
      title: 'Flutter Navigation 2.0 Dashboard by GoRouter & Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}

