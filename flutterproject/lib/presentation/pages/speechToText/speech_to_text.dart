import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/extension/padding_extension.dart';
import 'package:flutterproject/presentation/pages/speechToText/speech_to_text_mixin.dart';
 import '../../../core/widgets/appbar/custom_appbar_widget.dart';
import '../../../core/widgets/elevatedbutton/custom_button.dart';
import '../../widgets/speechToText/speech_button.dart';
import '../../widgets/speechToText/speech_resul_card_widget.dart';

@RoutePage()
class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> with SpeechToTextMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Speech To Text'),
      body: Column(
        children: [
          SpeechButton(isListening: isListening, onPressed: isListening ? stopListening : startListening),
          const SizedBox(height: 30),
          SpeechResultCard(text: text),
        ],
      ).symmetricPadding(horizontal: 20.0, vertical: 20.0),
    );
  }
}

