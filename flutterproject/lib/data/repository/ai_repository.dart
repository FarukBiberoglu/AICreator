import 'dart:io';
import 'dart:typed_data';

import 'package:flutterproject/data/service/image_to_text_service.dart';
import 'package:flutterproject/data/service/text_to_image.dart';
import 'package:flutterproject/data/service/text_to_speech.dart';

class AiRepository{
  Future<String?> generateText(File file) async {
    return ImageToTextService().generateText(file);
  }
  Future<Uint8List?> generateImage(String prompt) async{
    return  TextToImageService().generateImage(prompt);
  }
  Future<Uint8List?> generateSpeech(String prompt) async{
    return TextToSpeechService().generateSpeech(prompt);
  }
}