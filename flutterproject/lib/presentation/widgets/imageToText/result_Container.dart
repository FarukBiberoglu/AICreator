import 'package:flutter/material.dart';

import '../../../core/constant/color_constant.dart';

class ResultContainer extends StatelessWidget {
  final String generatedText;

  const ResultContainer({
    super.key,
    required this.generatedText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConstant.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: ColorConstant.primaryPurple,
                size: 24,
                shadows: [
                  Shadow(
                    color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
                    blurRadius: 2,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(
                'AI Description',
                style: TextStyle(
                  color: ColorConstant.primaryPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                      color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            generatedText,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
              height: 1.5,
              shadows: [
                Shadow(
                  color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
                  blurRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
