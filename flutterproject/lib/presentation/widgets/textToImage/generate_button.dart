import 'package:flutter/material.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/widgets/container/custom_container.dart';
import '../../../core/widgets/elevatedbutton/custom_button.dart';

class GenerateButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback generate;

  const GenerateButton({super.key, required this.isLoading, required this.generate});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 60,
      color: ColorConstant.primaryPurple,
      child: CustomElevatedButton(
        onPressed: isLoading ? null : generate,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLoading)
              const Icon(Icons.auto_awesome, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              isLoading ? "Creating a Visual..." : "Imagine",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
