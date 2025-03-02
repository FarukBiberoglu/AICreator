import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/widgets/appbar/custom_appbar_widget.dart';
import 'package:flutterproject/presentation/pages/textToSpeech/text_to_speech_mixin.dart';
import 'package:flutterproject/presentation/widgets/textToSpeech/text_to_speech_body.dart';

@RoutePage()
class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({super.key});

  @override
  _TextToSpeechPageState createState() => _TextToSpeechPageState();
}

class _TextToSpeechPageState extends State<TextToSpeechPage> with TextToSpeechMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "AI Text to Speech"),
      body: TextToSpeechBody(
        controller: controller,
        audioPlayer: audioPlayer,
        generateAndPlay: generateAndPlay,
        isPlaying: isPlaying,
      ),
    );
  }
}