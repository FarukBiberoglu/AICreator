import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_router.dart';
import 'build_Card.dart';
class TextToSpeechWidget extends StatelessWidget {
  const TextToSpeechWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BuildCard(
      title:'Text to Speech',
      description: 'Text reader assistant',
      icon:  Icons.record_voice_over_outlined,
      onTap:() => context.router.push(const TextToSpeechRoute()),
    );
  }
}
