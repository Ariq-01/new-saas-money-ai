import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  final String baseUrl;

  AiService({this.baseUrl = 'http://10.0.2.2:3000'});

  Future<String> chat(String message, {String? persona}) async {
    final http.Response response;
    try {
      response = await http.post(
        Uri.parse('$baseUrl/api/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': message,
          if (persona != null) 'persona': persona,
        }),
      );
    } catch (_) {
      throw Exception('Server is down');
    }

    if (response.statusCode != 200) {
      throw Exception('Server is down');
    }

    final data = jsonDecode(response.body);
    print('RESPONSE: ${response.body}');
    return data['message']['content'] as String;
  }
}
