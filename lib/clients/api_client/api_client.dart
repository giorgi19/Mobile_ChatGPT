import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  ApiClient.localhost({
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'http://localhost:8080',
          httpClient: httpClient,
        );

  final String _baseUrl;
  final http.Client _httpClient;

  Future<String?> getData({
    required String id,
    int? limit,
    int? offset,
    bool preview = false,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/v1/articles/$id').replace(
      queryParameters: <String, String>{
        if (limit != null) 'limit': '$limit',
        if (offset != null) 'offset': '$offset',
        'preview': '$preview',
      },
    );
    final response = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(),
    );
    final body = response.json();

    if (response.statusCode != HttpStatus.ok) {
      throw ApiRequestFailure(
        body: body,
        statusCode: response.statusCode,
      );
    }

    return '';
    // Response.fromJson(body);
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
    };
  }
}

extension on http.Response {
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

class ApiMalformedResponse implements Exception {
  const ApiMalformedResponse({required this.error});

  /// The associated error.
  final Object error;
}

class ApiRequestFailure implements Exception {
  const ApiRequestFailure({
    required this.statusCode,
    required this.body,
  });

  /// The associated http status code.
  final int statusCode;

  /// The associated response body.
  final Map<String, dynamic> body;
}
