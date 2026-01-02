import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> postRequestServies(
  String url,
  Map<String, dynamic> data,
) async {
  var response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
    body: jsonEncode(data),
  );

  print("RAW SERVER RESPONSE:");
  print(response.body); // 👈 مهم جدا لتصطاد أي خطأ PHP

  return jsonDecode(response.body);
}
