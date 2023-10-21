import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:liftu_tech_ecommerce_app_with_itern/controller/api/platzi_api.dart';

void main() {
  group('PlatziApi Tests', () {
    late PlatziApi apiService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient((request) async {
        if (request.url.path == '/api/v1/categories') {
          return http.Response(
              '[{"id": 1,"name": "Clothes", "image": "https://i.imgur.com/lVH533g.jpeg", "creationAt": "2023-10-21T04:38:54.000Z", "updatedAt": "2023-10-21T04:38:54.000Z" }]',
              200);
        } else if (request.url.path == '/api/v1/products') {
          return http.Response(
              '[{"id": 25, "title": "Ergonomic Rubber Tuna", "price": 763, "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive", "images": ["https://i.imgur.com/5iNAL9T.jpeg", "https://i.imgur.com/M3QKiC5.jpeg", "https://i.imgur.com/rUWNzYa.jpeg"], "creationAt": "2023-10-20T03:26:28.000Z", "updatedAt": "2023-10-20T03:26:28.000Z", "category": { "id": 2, "name": "IPhone", "image": "https://i.imgur.com/DumuKkD.jpeg", "creationAt": "2023-10-20T03:26:28.000Z", "updatedAt": "2023-10-20T05:38:12.000Z" }]}',
              200);
        } else {
          return http.Response('Not Found', 404);
        }
      });

      apiService = PlatziApi(client: mockClient);
    });

    test('Test getCategories', () async {
      final categories = await apiService.getCategories();

      expect(categories, isNotNull);
    });

    test('Test getProduct', () async {
      final products = await apiService.getProduct();

      expect(products, isNotNull);
    });

    test('Test getProductsByCategory', () async {
      const categoryId = 1;
      final products = await apiService.getProductsByCategory(categoryId);

      expect(products, isNotNull);
    });

    test('Test getProductsBySearch', () async {
      const query = 'example';
      final products = await apiService.getProductsBySearch(query);

      expect(products, isNotNull);
    });
  });
}
