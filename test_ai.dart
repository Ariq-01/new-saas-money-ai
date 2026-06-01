import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const baseUrl = 'http://localhost:3000';

  print('Mengirim pesan ke server...');

  final response = await http.post(
    Uri.parse('$baseUrl/api/chat'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'message': 'Halo'}),
  );

  print('Status: ${response.statusCode}');
  print('RESPONSE: ${response.body}');
}
