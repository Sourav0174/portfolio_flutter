import 'dart:convert';
import 'package:http/http.dart' as http;

class HubspotService {
  static Future<bool> submitForm({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse(
      "https://api.hsforms.com/submissions/v3/integration/submit/245442355/f2d117b6-0415-4fd7-9d53-6b48a142faeb",
    );

    final body = {
      "fields": [
        {"name": "firstname", "value": name},
        {"name": "email", "value": email},
        {"name": "message", "value": message},
      ],
    };

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response.statusCode == 200;
  }
}
