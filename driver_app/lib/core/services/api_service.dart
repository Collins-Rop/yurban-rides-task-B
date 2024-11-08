import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // For testing purposes, we'll use static data
  static Future<List<County>> getCounties() async {
    // Simulating API call
    await Future.delayed(const Duration(seconds: 1));
    return [
      County(id: '1', name: 'Nairobi'),
      County(id: '2', name: 'Mombasa'),
      County(id: '3', name: 'Kisumu'),
    ];
  }

  static Future<List<SubCounty>> getSubCounties(String countyId) async {
    // Simulating API call
    await Future.delayed(const Duration(milliseconds: 500));
    final Map<String, List<SubCounty>> mockData = {
      '1': [
        SubCounty(id: '1', name: 'Westlands', countyId: '1'),
        SubCounty(id: '2', name: 'Kibra', countyId: '1'),
        SubCounty(id: '3', name: 'Langata', countyId: '1'),
      ],
      '2': [
        SubCounty(id: '4', name: 'Mvita', countyId: '2'),
        SubCounty(id: '5', name: 'Likoni', countyId: '2'),
      ],
      '3': [
        SubCounty(id: '6', name: 'Nyakach', countyId: '3'),
        SubCounty(id: '7', name: 'Muhoroni', countyId: '3'),
      ],
    };
    return mockData[countyId] ?? [];
  }
}