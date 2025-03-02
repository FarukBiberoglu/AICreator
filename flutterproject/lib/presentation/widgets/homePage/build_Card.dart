import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';

import '../../../core/constant/color_constant.dart';

class  BuildCard extends StatelessWidget {
  const BuildCard ({super.key,required this.onTap,required this.icon,required this.description,required this.title});

  final VoidCallback? onTap;
  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: ColorConstant.cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
                blurRadius: 1,
                spreadRadius: 0.5,
              ),
              BoxShadow(
                color: Colors.purpleAccent.withValues(alpha: 0.5),
                blurRadius: 1,
                spreadRadius: 0.5,
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: ColorConstant.primaryPurple),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54,
                  fontStyle: FontStyle.italic,


                ),
              ),

              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
            ],
          ).symmetricPadding(horizontal: 20.0,vertical: 20.0),

        ),
      );

  }
}
