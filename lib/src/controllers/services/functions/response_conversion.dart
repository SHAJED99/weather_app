import 'package:http/http.dart' as http;

extension HttpResponseJson on http.Response {
  // Serialization function: Convert http.Response object to a JSON-compatible map
  Map<String, dynamic> get customToJson {
    return {
      'statusCode': statusCode,
      'body': body,
      // 'headers': this.headers.map,
    };
  }
}

extension MapExtension on Map<String, dynamic> {
  http.Response get customToHttpResponse {
    return http.Response(
      (this['body'] ?? "").toString(),
      int.tryParse((this['statusCode'] ?? "").toString()) ?? 0,
      // headers: Map<String, String>.from(this['headers'] ?? {}),
    );
  }
}
