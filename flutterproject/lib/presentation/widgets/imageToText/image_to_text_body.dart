import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterproject/core/constant/sized_box.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';
import 'package:flutterproject/presentation/widgets/imageToText/result_Container.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/widgets/appbar/custom_appbar_widget.dart';
import 'action_buttons_row.dart';
import 'image_continer_widget.dart';

class BodyWidget extends StatelessWidget {
  final File? selectedImage;
  final bool isLoading;
  final Function(ImageSource) pickImage;
  final String? generatedText;

  const BodyWidget({
    Key? key,
    required this.selectedImage,
    required this.isLoading,
    required this.pickImage,
    this.generatedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(title: 'AI Image Analyzer'),
          const SizedBox(height: 30),
          ImageContinerWidget(selectedImage: selectedImage, isLoading: isLoading),
          SizeConstant.hightheight,
          ActionButtonsRow(pickImage: pickImage),
          if (generatedText != null) ...[
            SizeConstant.hightheight,
            ResultContainer(generatedText: generatedText!),
            SizeConstant.mediumheight,
          ],
        ],
      ),
    ).symmetricPadding(horizontal: 20, vertical: 15.0);
  }
}
