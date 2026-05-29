import 'dart:convert';
import 'dart:io';

void main() async {
  final url =
      Uri.parse('https://shakshak.net/api/v1/order/old-for-user?in_city=1');
  final request = await HttpClient().getUrl(url);
  request.headers.add('Authorization',
      'Bearer 202|T3V78WjSbmTXhuUHKM6lAuA91VF4u3vAM8r8dkxpc2e41459');
  request.headers.add('Accept', 'application/json');

  final response = await request.close();
  final strings = await response.transform(utf8.decoder).toList();
  final jsonStr = strings.join('');

  print('Response code: ${response.statusCode}');
  print('Response body:');
  try {
    final decoded = jsonDecode(jsonStr);
    print(decoded);
  } catch (e) {
    print('Error decoding JSON: $e');
    print(jsonStr);
  }
}
