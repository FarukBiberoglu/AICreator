import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_router.dart';
import 'build_Card.dart';

class SpeechToTextWidget extends StatelessWidget {
  const SpeechToTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildCard(
      title:  'Speech to Text',
      description: 'Voice to text converter',
      icon:  Icons.mic_none_rounded,
      onTap: () => context.router.push(const SpeechToTextRoute()),
    );
  }
}
