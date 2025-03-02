import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/routes/app_router.dart';
import 'package:flutterproject/presentation/widgets/homePage/build_Card.dart';

class ImageToTextWidget extends StatelessWidget {
  const ImageToTextWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BuildCard(
      title: 'Image to Text',
      description:  'AI image analyzer',
      icon:   Icons.text_fields_rounded,
      onTap:  () => context.router.push(const ImageToTextRoute()),
    );

  }
}
