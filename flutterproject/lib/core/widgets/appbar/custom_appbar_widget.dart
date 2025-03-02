import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        context.router.back();
      }, icon: Icon(Icons.arrow_back,color: Colors.white54,)),
      backgroundColor: Colors.transparent,
      title: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            Colors.red,
            Colors.purple,
            Colors.purple.withValues(alpha: 1.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ).allPadding(20)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
