import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/constant/color_constant.dart';
import 'package:flutterproject/presentation/pages/textToImage/text_to_image_mixin.dart';
import '../../widgets/textToImage/text_to_image_body.dart';

@RoutePage()
class TextToImagePage extends StatefulWidget {
  const TextToImagePage({super.key});

  @override
  _TextToImagePageState createState() => _TextToImagePageState();
}

class _TextToImagePageState extends State<TextToImagePage> with TextToImageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkBackground,
      body:TextToImageBody(
        controller: controller,
        generate: generate,
        isLoading: isLoading,
        imageUrl: imageUrl,

      )
    );
  }
}
