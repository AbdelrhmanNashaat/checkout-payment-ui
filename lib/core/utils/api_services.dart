import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();
  Future<Response> post(
      {required String url, required String token, required body}) async {
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
