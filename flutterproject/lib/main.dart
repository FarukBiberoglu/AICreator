import 'package:flutter/material.dart';
import 'core/observes/observes.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [CustomRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.theme
    );
  }
}
