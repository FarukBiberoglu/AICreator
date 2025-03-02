import 'package:flutter/material.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/widgets/textfield/custom_textfield.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  const InputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: ColorConstant.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorConstant.primaryPurple.withOpacity(0.7),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.primaryPurple.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Put Your Imagination in Writing",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          CustomTextField(controller: controller),
        ],
      ),
    );
  }
}
