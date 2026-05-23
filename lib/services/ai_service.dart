import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  final String baseUrl;

  AiService({this.baseUrl = 'http://10.0.2.2:3000'});

  Future<String> chat(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode != 200) {
      throw Exception('AI request failed: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    return data['message']['content'] as String;
  }
}
