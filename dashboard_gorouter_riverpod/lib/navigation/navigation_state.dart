import 'package:dashboard_gorouter_riverpod/navigation/go_router_refresh_listener.dart';
import 'package:dashboard_gorouter_riverpod/screens/home_content_view.dart';
import 'package:dashboard_gorouter_riverpod/screens/item1_content_view.dart';
import 'package:dashboard_gorouter_riverpod/screens/item1_sub_content1_view.dart';
import 'package:dashboard_gorouter_riverpod/screens/landing_page.dart';
import 'package:dashboard_gorouter_riverpod/sidebar/sidebar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controller/user_controller.dart';
import '../screens/main_layout_view.dart';
import '../screens/item1_sub_content2_view.dart';
import '../screens/item2_content_view.dart';
import '../screens/item3_content_view.dart';
import '../screens/login_page.dart';
import '../screens/not_found_view.dart';


final goRouteProvider = Provider<GoRouter>((ref) {
  final _parentNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorkey = GlobalKey<NavigatorState>();
  final refreshListener = ref.read(goRouterRefreshListener);
  debugPrint("goRouteProvider: called");

  ref.onDispose(() {
    refreshListener.dispose();
  });

  return GoRouter(
    navigatorKey: _parentNavigatorKey,
    initialLocation: LandingPage.routeLocation,
    refreshListenable: refreshListener,
    redirect: (context, state){
      bool loggedIn = ref.read(userProvider);
      String location = state.location;
      bool areWeloggingIn = state.location == LoginPage.routeLocation;

      if(!loggedIn){
        if(areWeloggingIn || location == LandingPage.routeLocation){
          return null;
        }
        debugPrint("redirect: $location to login page when user is not loggedin.");
        return LoginPage.routeLocation;
      }

      //after successfull login:
      if(areWeloggingIn){
        debugPrint("redirect: $location to home page when user is loggedin");
        return HomeContentView.routeLocation;
      }

      if(location.toLowerCase() == MenuUtils.logoutRouteLocation){
        debugPrint("redirect: to landing page. becuase logout called");
        ref.read(userProvider.notifier).logout();
        return LandingPage.routeLocation;
      }
      return null;
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _parentNavigatorKey,
        path: LandingPage.routeLocation,
        name: LandingPage.routeName,
        pageBuilder: (context , state) => NoTransitionPage(child: LandingPage(key: state.pageKey)),
      ),
      GoRoute(
        parentNavigatorKey: _parentNavigatorKey,
        path: LoginPage.routeLocation,
        name: LoginPage.routeName,
        pageBuilder: (context , state) => NoTransitionPage(child: LoginPage(key: state.pageKey)),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorkey,
        pageBuilder: (context, state, child) {
          debugPrint("ShellRoute-builder-child:${child.toStringShort()}");
          return NoTransitionPage(child: MainLayoutView(key: state.pageKey, body: child));
        },
        routes: [
          GoRoute(
            path: HomeContentView.routeLocation,
            name: HomeContentView.routeName,
            pageBuilder: (context , state) => NoTransitionPage(child: HomeContentView(key: state.pageKey)),
          ),
          GoRoute(
            path: Item1ContentView.routeLocation,
            name: Item1ContentView.routeName,
              pageBuilder: (context , state) => NoTransitionPage(child: Item1ContentView(key: state.pageKey)),
            routes: [
              GoRoute(
                path: "a",
                name: "a",
                pageBuilder: (context , state) => NoTransitionPage(child: Item1SubContent1View(key: state.pageKey)),
              ),
              GoRoute(
                path: "b",
                name: "b",
                pageBuilder: (context , state) => NoTransitionPage(child: Item1SubContent2View(key: state.pageKey)),
              )
            ]
          ),
          GoRoute(
            path: Item2ContentView.routeLocation,
            name: Item2ContentView.routeName,
            pageBuilder: (context , state) => NoTransitionPage(child: Item2ContentView(key: state.pageKey)),
          ),
          GoRoute(
            path: Item3ContentView.routeLocation,
            name: Item3ContentView.routeName,
            pageBuilder: (context , state) => NoTransitionPage(child: Item3ContentView(key: state.pageKey)),
          ),
          GoRoute(
            path: MenuUtils.logoutRouteLocation,
            name: MenuUtils.logoutRouteLocation.replaceAll("/", ""),
            redirect: (context, state) { return null; },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => NotFoundView(key: state.pageKey),
  );
});

