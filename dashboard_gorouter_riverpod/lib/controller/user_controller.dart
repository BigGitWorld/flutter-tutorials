import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation/go_router_refresh_listener.dart';

final userProvider = StateNotifierProvider<UserController, bool>((ref) => UserController(ref));

class UserController extends StateNotifier<bool> {

  final Ref _ref;
  late bool _isLoggedIn;

  UserController(this._ref) : super(false){
    _isLoggedIn = false;
  }

  //its better use "GoRouter.pop" after successfull login to remove "login page" from navigation stack.
  //so we dont use "goRouterRefreshListener" here.
  void login(){
    _isLoggedIn = true;
    state = true;
    //_ref.read(goRouterRefreshListener).update();
  }

  //we want to redirect after logout to landing page not login page.
  //so we dont use "goRouterRefreshListener" here.
  void logout(){
    _isLoggedIn = false;
    state = false;
    //_ref.read(goRouterRefreshListener).update();
  }

}