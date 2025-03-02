import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends AutoRouterObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
    super.didPop(route, previousRoute);
  }
}