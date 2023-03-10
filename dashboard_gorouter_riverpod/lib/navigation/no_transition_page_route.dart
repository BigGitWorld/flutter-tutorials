import 'package:flutter/material.dart';

class NoTransitionPageRoute extends MaterialPageRoute {

  NoTransitionPageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 0);

}