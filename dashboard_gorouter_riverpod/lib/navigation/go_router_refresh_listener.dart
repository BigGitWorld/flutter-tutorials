import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterRefreshListener = ChangeNotifierProvider((ref) => _GoRouterRefreshListener());

class _GoRouterRefreshListener extends ChangeNotifier {

  void update(){
    notifyListeners();
  }

}