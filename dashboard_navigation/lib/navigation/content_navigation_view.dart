import 'package:dashboard_navigation/navigation/navigation_state.dart';
import 'package:dashboard_navigation/not_found_view.dart';
import 'package:dashboard_navigation/screens/item1_content_view.dart';
import 'package:dashboard_navigation/sidebar/sidebar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/item2_content_view.dart';
import '../screens/item3_content_view.dart';
import 'no_transition_page_route.dart';

class ContentView extends ConsumerWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build::: ContentView");
    return Navigator(
      key: ref.read(navigationProvider.notifier).navigationKey,
      initialRoute: "/",
      onGenerateRoute: (settings) => onGenerateRoute(ref, settings),
    );
  }

  Route? onGenerateRoute(WidgetRef ref, RouteSettings settings){
    String? activePage = settings.name;
    debugPrint("onGenerateRoute");
    if(activePage == "/" || activePage == MenuUtils.menuItems[0].route){
      return NoTransitionPageRoute(builder: (context) => const Item1ContentView());
    }
    if(activePage == MenuUtils.menuItems[1].route){
      return NoTransitionPageRoute(builder: (context) => const Item2ContentView());
    }
    if(activePage == MenuUtils.menuItems[2].route){
      return NoTransitionPageRoute(builder: (context) => const Item3ContentView());
    }
    return NoTransitionPageRoute(builder: (context) => const NotFoundView());
  }

}
