import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterproject/core/constant/color_constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/widgets/imageSaver/image_saver.dart';
import 'dialog.dart';

mixin DialogMixin on State<SimpleImageDialog>{
  bool isLoadingImage = false;

  void saveImage() {
    setState(() {
      isLoadingImage = true;
    });

    ImageSaver.I.saveUint8ListAsFile(
      uint8List: widget.imagememory,
      callback: (href) {
        setState(() {
          isLoadingImage = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:Text('Image successfully downloaded!\nLocation: $href'),
            backgroundColor: Colors.deepPurple,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        );
      },
    );
  }

  Future<void> shareImage() async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/shared_image.png';
      final file = File(filePath);
      await file.writeAsBytes(widget.imagememory, flush: true);
      if (!mounted) return;


      if (file == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Görsel paylaşılırken hata oluştu!'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        );
        return;
      }
      if (!mounted) return;

      final ShareResult result = await Share.shareXFiles(

        [XFile(filePath, mimeType: 'image/png')],
        text: "Güzel resim",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      if (!mounted) return;

      if (result.status == ShareResultStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Görsel başarıyla paylaşıldı!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint('Hata: $e');
    }
  }

}