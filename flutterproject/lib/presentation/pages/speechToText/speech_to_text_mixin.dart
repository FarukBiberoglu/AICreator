import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/pages/speechToText/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

mixin SpeechToTextMixin on State<SpeechToTextPage> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool isListening = false;
  String text = "Let's Started";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    bool available = await _speechToText.initialize();
    if(!mounted) return;


  }

  void startListening() async {
    setState(() {
      isListening = true;
      text = "Listening...";
    });
    _speechToText.listen(
      onResult: (result) {
        setState(() {
          text = result.recognizedWords;
        });
      },
    );
  }

  void stopListening() async {
    setState(() {
      isListening = false;
      text = "Listening stopped.";
    });
    _speechToText.stop();
  }

  @override
  void dispose() {
    super.dispose();
    _speechToText.stop();
  }
}
