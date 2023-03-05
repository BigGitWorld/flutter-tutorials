import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider =
    StateNotifierProvider<NavigationStateNotifier, String?>(
        (_) => NavigationStateNotifier(null));

class NavigationStateNotifier extends StateNotifier<String?> {
  NavigationStateNotifier(String? state) : super(state);

  void setActivePage(String pageName) {
    state = pageName;
  }

  void reset() {
    state = null;
  }
}
