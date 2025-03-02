import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';

import '../../../core/constant/color_constant.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.red,
          ColorConstant.primaryPurple.withValues(alpha: 0.9),
        ],
      ).createShader(bounds),
      child: Row(
        children: [
          const  Text(
            'Artificial\nIntelligence',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.2,
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.blueAccent,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ).onlyPadding(top: 35.0,left: 10.0),
        ],
      ),

    );
  }
}
