import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/category.dart';
import '../../model/product/product.dart';

class PlatziApi {
  final String baseUrl = 'https://api.escuelajs.co/api/v1/';

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}categories'));
    if (response.statusCode == 200) {
      final List<dynamic> categories = json.decode(response.body);
      return categories.map((category) => Category.fromMap(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse('${baseUrl}products'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((product) => Product.fromMap(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response =
        await http.get(Uri.parse('${baseUrl}products/?categoryId=$categoryId'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((product) => Product.fromMap(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductById(int productId) async {
    final response = await http.get(Uri.parse('${baseUrl}products/$productId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> product = json.decode(response.body)['data'];
      return Product.fromMap(product);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> getProductsBySearch(String query) async {
    final response =
        await http.get(Uri.parse('${baseUrl}products/?title=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      // print(products);

      return products.map((product) => Product.fromMap(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
