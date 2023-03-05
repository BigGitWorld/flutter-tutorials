import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //keep active page name by a state to be able to show desired page/screen.
  String? activePage;

  void setActivePage(String pageName) {
    setState(() {
      activePage = pageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation 2.0 (Declarative) Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: _pages(context),
        onPopPage: (route, result) {
          bool popState = route.didPop(result);
          //we want to delete state when do hot-reload to show home screen first
          if (popState) {
            activePage = null;
          }
          return popState;
        },
      ),
    );
  }

  //stack of application's pages
  List<Page> _pages(BuildContext context) {
    List<Page> pages = [];
    pages.add(MaterialPage(child: FirstScreen(onPageChange: setActivePage)));
    switch (activePage) {
      case "second":
        pages.add(
            MaterialPage(child: SecondScreen(onPageChange: setActivePage)));
        break;
      case "third":
        pages
            .add(MaterialPage(child: ThirdScreen(onPageChange: setActivePage)));
        break;
    }
    return pages;
  }
}

//====================================================//
//FirstScreen
//====================================================//
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.onPageChange}) : super(key: key);

  final Function onPageChange;

  @override
  Widget build(BuildContext context) {
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
              "You can navigate to another screen \nby calling MyApp's 'setActivePage()' method \nthat changes state of activePage",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => onPageChange("second"),
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
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.onPageChange}) : super(key: key);

  final Function onPageChange;
  @override
  Widget build(BuildContext context) {
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
              "You can navigate to another screen \nby calling MyApp's 'setActivePage()' method \nthat changes state of activePage",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => onPageChange("third"),
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
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key, required this.onPageChange}) : super(key: key);

  final Function onPageChange;
  @override
  Widget build(BuildContext context) {
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
              "You can navigate to another screen \nby calling MyApp's 'setActivePage()' method \nthat changes state of activePage",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => onPageChange("first"),
              child: const Text("Go to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
