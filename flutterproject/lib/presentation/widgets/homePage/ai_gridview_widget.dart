import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/widgets/homePage/image_to_text_widget.dart';
import 'package:flutterproject/presentation/widgets/homePage/speech_to_text_widget.dart';
import 'package:flutterproject/presentation/widgets/homePage/text_to_image_widget.dart';
import 'package:flutterproject/presentation/widgets/homePage/text_to_speech_widget.dart';

class AiGridviewWidget extends StatelessWidget {
  const AiGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 25,
      ),
      children: [
        TextToImageWidget(),
        SpeechToTextWidget(),
        ImageToTextWidget(),
        TextToSpeechWidget()

      ],
    );
  }
}
