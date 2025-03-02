import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/constant/color_constant.dart';

class ImageContinerWidget extends StatelessWidget {
   ImageContinerWidget({super.key,required this.selectedImage, required this.isLoading,});
  File? selectedImage;
   final bool isLoading ;

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        color: ColorConstant.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorConstant.primaryPurple.withValues(alpha: 0.4),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.primaryPurple.withValues(alpha: 0.6),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: selectedImage != null
          ? Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              selectedImage!,
              fit: BoxFit.cover,
            ),
          ),
          if (isLoading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: ColorConstant.primaryPurple,
                      strokeWidth: 3,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Analyzing image...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: ColorConstant.primaryPurple.withValues(alpha: 0.8),

                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_search,
            size: 80,
            color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
            shadows: [
              Shadow(
                color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
                blurRadius: 13,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Select an image to analyze",
            style: TextStyle(
              color: ColorConstant.primaryPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: ColorConstant.primaryPurple.withValues(alpha: 0.1),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Choose from camera or gallery",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );  }
}
