import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';

class CustomContainer extends StatelessWidget {
  final double? width ;
  final double height;
  final Color color;
  final Widget? child;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const CustomContainer({
    Key? key,
    this.width,
    this.height = 60,
    required this.color,
    this.child,
    this.borderRadius,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstant.primaryPurple.withValues(alpha: 0.7),
            color.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}