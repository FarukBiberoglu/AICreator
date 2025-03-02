import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';


final class ImageSaver {
  ImageSaver._init();
  static final ImageSaver _instance = ImageSaver._init();
  static ImageSaver get I => _instance;

  Future<void> downloadFile({
    required String url,
    String? title,
    void Function(String? href)? callback,
  }) async {
    try {
      late Directory downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        downloadsDirectory = Directory('/Downloads');
      } else {
        callback?.call(null);
      }

      if (!downloadsDirectory.existsSync()) {
        downloadsDirectory.createSync();
      }

      final fileName = title ?? url.split('/').last;
      final dio = Dio();
      final path = '${downloadsDirectory.path}/$fileName';
      final res = await dio.download(url, path);

      if (res.statusCode != 200) {
        callback?.call(null);
      }

      callback?.call(path);
    } on Exception catch (_) {
      callback?.call(null);
    }
  }

  Future<File?> saveUint8ListAsFile({
    required Uint8List uint8List,
    String? title,
    void Function(String? path)? callback,
  }) async {
    try {
      late Directory downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        downloadsDirectory = Directory('/Documents');
      } else {
        callback?.call(null);
        return null;
      }

      if (!downloadsDirectory.existsSync()) {
        downloadsDirectory.createSync();
      }

      final fileName = title ?? 'downloaded_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final path = '${downloadsDirectory.path}/$fileName';

      // Dosyaya yazma işlemi
      final file = File(path);
      await file.writeAsBytes(uint8List,flush: true);

      // Callback ile dosya yolunu geri gönderme
      callback?.call(path);
      return file;
    } on Exception catch (_) {
      callback?.call(null);
      return null;
    }
  }
}
