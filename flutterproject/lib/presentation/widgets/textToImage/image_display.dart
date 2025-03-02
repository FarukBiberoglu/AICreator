import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../core/constant/color_constant.dart';
import '../../widgets/textToImage/dialog.dart';

class ImageDisplay extends StatelessWidget {
  final bool isLoading;
  final Uint8List? imageUrl;

  const ImageDisplay({super.key, required this.isLoading, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imageUrl != null) {
          showDialog(
            context: context,
            builder: (_) => SimpleImageDialog(imagememory: imageUrl!),
          );
        }
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.45,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorConstant.primaryPurple.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.primaryPurple.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : imageUrl != null
              ? Image.memory(imageUrl!, fit: BoxFit.contain)
              : _buildEmptyState(),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.image_search,
          size: 80,
          color: ColorConstant.primaryPurple.withOpacity(0.5),
        ),
        const SizedBox(height: 16),
        Text(
          "Turn Your Dreams into Reality",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.primaryPurple,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Write a detailed description and let AI \ncreate a customized image for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
