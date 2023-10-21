import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/category.dart';

class PlatziApi {
  final String baseUrl = 'https://api.escuelajs.co/api/v1/';

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}categories'));
    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body)['data'];
      return categories.map((category) => Category.fromMap(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
