import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/widgets/homePage/home_page_body.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }

}
