import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/categories.dart';

class PlatziApi {
  final String baseUrl = 'https://api.escuelajs.co/api/v1/';

  Future<List<Categories>> getCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}categories'));
    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body)['data'];
      return categories
          .map((category) => Categories.fromMap(category))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
