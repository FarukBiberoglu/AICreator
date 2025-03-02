import 'dart:io';
import 'package:dio/dio.dart';

class ImageToTextService {
  final Dio _dio = Dio();
  final String apiUrl = "YOUR API URL";
  final String apiKey = "YOUR API KEY";

  Future<String?> generateText(File file) async {
    try {
      List<int> fileBytes = await file.readAsBytes();
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: {
            "Authorization": apiKey,
            "Content-Type": "application/octet-stream",

          },

        ),
         data: Stream.fromIterable([fileBytes])
      );

      if (response.statusCode == 200) {
        final dataJsonList= response.data as List<dynamic>?;
        if(dataJsonList?.isEmpty==true) return null;
        final data = dataJsonList!.first["generated_text"] as String?;
        return data;
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