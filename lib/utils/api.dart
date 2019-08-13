import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'http://demo7511610.mockable.io/';

Future<dynamic> fetch(String endPoint) async {
  final response = await http.get('$url/$endPoint');
  return json.decode(response.body);
}
