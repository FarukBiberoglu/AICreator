import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';

import '../../../core/constant/sized_box.dart';
import '../../../core/widgets/appbar/custom_appbar_widget.dart';
import 'generate_button.dart';
import 'image_display.dart';
import 'input_field.dart';

class TextToImageBody extends StatelessWidget {
   TextToImageBody({super.key,required this.isLoading,required this.imageUrl,required this.generate,required this.controller});

  TextEditingController controller = TextEditingController();
  bool isLoading;
  Uint8List? imageUrl;
   final VoidCallback generate;



   @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(title: 'AI Image Creator'),
          SizeConstant.mediumheight,
          InputField(controller: controller),
          SizeConstant.largeheight,
          GenerateButton(isLoading: isLoading, generate: generate),
          if (isLoading || imageUrl != null) ...[
            SizeConstant.largeheight,
            ImageDisplay(isLoading: isLoading, imageUrl: imageUrl),
            SizeConstant.mediumheight,
          ],
        ],
      ).symmetricPadding(horizontal: 20.0),
    );
  }
}
