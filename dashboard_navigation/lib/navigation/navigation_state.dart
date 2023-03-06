import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider =
StateNotifierProvider<NavigationStateNotifier, String?>(
        (_) => NavigationStateNotifier(null));

class NavigationStateNotifier extends StateNotifier<String?> {
  NavigationStateNotifier(String? state) : super(state);

  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  void setActivePage(String pageName) {
    navigationKey.currentState!.pushNamed(pageName);
    state = pageName;
  }

  void reset() {
    state = null;
  }
}

