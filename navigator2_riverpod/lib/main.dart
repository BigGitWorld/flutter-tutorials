import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Navigation 2.0 with the Riverpod state management Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: _pages(ref, context),
        onPopPage: (route, result) {
          bool popState = route.didPop(result);
          //we want to delete state when do hot-reload to show home screen first
          if (popState) {
            ref.read(navigationProvider.notifier).reset();
          }
          return popState;
        },
      ),
    );
  }

  //stack of application's pages
  List<Page> _pages(WidgetRef ref, BuildContext context) {

    String? activePage = ref.watch(navigationProvider);

    List<Page> pages = [];
    pages.add(const MaterialPage(child: FirstScreen()));
    switch (activePage) {
      case "second":
        pages.add(
            const MaterialPage(child: SecondScreen()));
        break;
      case "third":
        pages
            .add(const MaterialPage(child: ThirdScreen()));
        break;
    }
    return pages;
  }
}

//====================================================//
//FirstScreen
//====================================================//
class FirstScreen extends ConsumerWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You can use state management tools \n(here riverpod) to manage navigation state",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref.read(navigationProvider.notifier).setActivePage("second"),
              child: const Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

//====================================================//
//SecondScreen
//====================================================//
class SecondScreen extends ConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, //default is true (to show back button)
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You can use state management tools \n(here riverpod) to manage navigation state",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref.read(navigationProvider.notifier).setActivePage("third"),
              child: const Text("Go to Third Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

//====================================================//
//ThirdScreen
//====================================================//
class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, //default is true (to show back button)
        title: const Text("Third Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You can use state management tools \n(here riverpod) to manage navigation state",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref.read(navigationProvider.notifier).setActivePage("first"),
              child: const Text("Go to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
