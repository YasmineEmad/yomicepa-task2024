import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHandler {
  static const baseUrl = 'https://portal-test.rxmaxreturns.com/rxmax';

  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body,String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  static Future<List<dynamic>> get(String endpoint, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return _handleGetResponse(response);
  }
  static Future<Map<String, dynamic>> getMap(String endpoint, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return _handleResponse(response);
  }
  static Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  static Future<void> delete(String endpoint, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    _handleResponse(response);
  }
  static List<dynamic> _handleGetResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
