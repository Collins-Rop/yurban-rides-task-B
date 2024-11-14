import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://yourapi.com/api';

  Future<void> registerDriver(Driver driver) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register_driver'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': driver.firstName,
        'last_name': driver.lastName,
        'phone_number': driver.phoneNumber,
        'pin': driver.pin,
        'gender': driver.gender,
        'email': driver.email,
        'county': driver.county,
        'sub_county': driver.subCounty,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register driver');
    }
  }
}