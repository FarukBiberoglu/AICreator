import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_router.dart';
import 'build_Card.dart';

class TextToImageWidget extends StatelessWidget {
  const TextToImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildCard(
      title: 'Text to Image',
      description:  'AI text analyzer',
      icon: Icons.image_outlined,
      onTap: () => context.router.push(const TextToImageRoute()),
    );
  }
}
