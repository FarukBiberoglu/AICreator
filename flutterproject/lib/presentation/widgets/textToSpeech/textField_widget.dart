import 'package:flutter/material.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/widgets/textfield/custom_textfield.dart';
import '../../../core/extension/padding_extension.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const InputFieldWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorConstant.primaryPurple.withValues(alpha: 0.8),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.primaryPurple.withValues(alpha: 0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter text to convert to speech",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: ColorConstant.primaryPurple.withValues(alpha: 0.6),
                  blurRadius: 10,
                ),
              ],
            ),
          ).symmetricPadding(vertical: 20.0, horizontal: 20.0),
          CustomTextField(controller: controller),
        ],
      ),
    );
  }}