import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../widgets/imageToText/image_to_text_body.dart';
import 'image_to_text_mixin.dart';


@RoutePage()
class ImageToTextPage extends StatefulWidget {
  const ImageToTextPage({super.key});

  @override
  _ImageToTextPageState createState() => _ImageToTextPageState();
}

class _ImageToTextPageState extends State<ImageToTextPage> with ImageToTextMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  BodyWidget(
          selectedImage: selectedImage,
          isLoading: isLoading,
          pickImage: pickImage,
          generatedText: generatedText,
        )
    );
  }





}