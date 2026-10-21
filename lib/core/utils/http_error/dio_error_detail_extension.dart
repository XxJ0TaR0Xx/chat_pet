import 'package:dio/dio.dart';

extension DioExceptionDetailExtension on DioException {
  String? get detailMessage {
    final data = response?.data;
    if (data is! Map) return null;

    final detail = data['detail'];

    if (detail is String) return detail;

    if (detail is List) {
      final messages = detail.whereType<Map>().map((item) => item['msg']).whereType<String>().toList();

      if (messages.isNotEmpty) return messages.join('; ');
    }

    return null;
  }
}
