import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';
import 'package:flutterproject/presentation/widgets/textToSpeech/textField_widget.dart';
import 'audio_controller_widget.dart';

class TextToSpeechBody extends StatelessWidget {
  final TextEditingController controller;
  final dynamic audioPlayer;
  final VoidCallback generateAndPlay;
  final bool isPlaying;

  const TextToSpeechBody({
    super.key,
    required this.controller,
    required this.audioPlayer,
    required this.generateAndPlay,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          InputFieldWidget(controller: controller),
          const SizedBox(height: 40),
          AudioControlsWidget(
            audioPlayer: audioPlayer,
            generateAndPlay: generateAndPlay,
            isPlaying: isPlaying,
          ),
        ],
      ).symmetricPadding(horizontal: 20.0, vertical: 20.0),
    );
  }
}