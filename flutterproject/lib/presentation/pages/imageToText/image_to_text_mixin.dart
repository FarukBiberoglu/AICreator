import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constant/color_constant.dart';
import '../../../data/repository/ai_repository.dart';
import 'image_to_text.dart';

mixin ImageToTextMixin on State<ImageToTextPage> {
  File? selectedImage;
  String? generatedText;
  bool isLoading = false;
  Future<void> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 70,
      );
      if(!mounted) return;

      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
          generatedText = null;
        });
        _generateText();
      }
    } catch (e) {
      _showErrorSnackBar("Resim seçme hatası: $e");
    }
  }

  Future<void> _generateText() async {
    if (selectedImage == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final result = await AiRepository().generateText(selectedImage!);
      if (!mounted) return;
      setState(() {
        generatedText = result;
        isLoading = false;
      });

      if (result == null) {
        _showErrorSnackBar("Görsel analiz edilemedi. Lütfen tekrar deneyin.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorSnackBar("Bir hata oluştu: $e");
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorConstant.primaryPurple,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
