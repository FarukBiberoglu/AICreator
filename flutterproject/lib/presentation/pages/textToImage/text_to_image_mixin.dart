import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/pages/textToImage/text_to_image_screen.dart';
import '../../../data/repository/ai_repository.dart';
import '../../../data/service/text_to_image.dart';


mixin TextToImageMixin on State<TextToImagePage> {
  final TextToImageService service = TextToImageService();
  final TextEditingController controller = TextEditingController();
  Uint8List? imageUrl;
  bool isLoading = false;



  Future<void> generate() async {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter description',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
      imageUrl = null;
    });

    String prompt = controller.text;
    Uint8List? url = await AiRepository().generateImage(prompt);

    if(!mounted) return;

    setState(() {
      imageUrl = url;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.clear();
  }
}