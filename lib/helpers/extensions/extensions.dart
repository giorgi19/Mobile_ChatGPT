import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_chatgpt/api/api.dart';

extension Json on http.Response {
  Map<String, dynamic> json() {
    try {
      return jsonDecode(body) as Map<String, dynamic>;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        ApiMalformedResponse(error: error),
        stackTrace,
      );
    }
  }
}
