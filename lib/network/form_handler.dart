import 'package:http/http.dart' as http;
import 'dart:convert';

class FormHandler {
  static Future saveForm(Map<String, dynamic> requestBody) async {
    var url = Uri.parse('http://10.0.2.2:3000/save');
    await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody));
  }
}
