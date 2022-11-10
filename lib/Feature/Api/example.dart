import 'dart:convert';
import 'package:http/http.dart' as http;

class exampleapi {
  Future sendEmail(
    String sendfrom,
    String email,
    String message,
  ) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_r6twr1a';
    const templateId = 'template_wg3ly1l';
    const userId = 'tBIsn8ALni6XCj0Fn';
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        }, //This line makes sure it works for all platforms.
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': sendfrom,
            'message': message,
            'send_to': email,
          }
        }));
    print(response.statusCode);
    return response.statusCode;
  }
}
