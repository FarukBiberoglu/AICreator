import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class TextToSpeechService {
  final Dio _dio = Dio();
  final String apiUrl = "YOUR API URL";
  final String apiKey = "YOUR API KEY";

  Future<Uint8List?> generateSpeech(String prompt) async {
    try {
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: {
            "Authorization": apiKey,
            "Content-Type": "application/json",
          },
          responseType: ResponseType.bytes,
        ),
        data: {
          "inputs": prompt,


        },
      );

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data);
      } else {
        print("API Hatası: ${response.statusCode}");
        print("Hata Detayı: ${response.data}");
        return null;
      }
    } on DioException catch (e) {
      print("Dio Hatası: ${e.message}");
      print("Hata Detayı: ${e.response?.data}");
      return null;
    } catch (e) {
      print("Beklenmeyen Hata: $e");
      return null;
    }
  }

  Future<bool> checkModelStatus() async {
    try {
      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {"Authorization": apiKey},
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      print("Model durum kontrolü hatası: $e");
      return false;
    }
  }
}