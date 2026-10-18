import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;
  final Dio _dio;
  ApiClient({required this.baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  Future<Response<dynamic>> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (err) {
      final message = _handleDioError(err);
      print(message);
      rethrow;
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please try again.";

      case DioExceptionType.sendTimeout:
        return "Sending request timed out.";

      case DioExceptionType.receiveTimeout:
        return "Server response timed out.";

      case DioExceptionType.connectionError:
        return ("Could not connect to the server");

      case DioExceptionType.badResponse:
        return ("Server returned an error response.");

      default:
        return ('somthing went wrong : ${error.message}');
    }
  }
}
