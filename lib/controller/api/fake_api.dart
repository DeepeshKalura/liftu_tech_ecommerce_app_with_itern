// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;

// import '../../model/hero_product.dart';

// class FakeAPI extends ChangeNotifier {
//   List<HeroProduct> _heroProducts = [];

//   List<HeroProduct> get heroProducts => _heroProducts;

//   set heroProducts(List<HeroProduct> heroProducts) {
//     _heroProducts = heroProducts;
//     notifyListeners();
//   }

//   void getHeroProducts() {
//     // there will be no error becuase it is statically created by myself
//     final file = File(
//       path.join(
//         Directory.fromRawPath('D:/flutter/intern/test/liftu_tech_ecommerce_app_with_itern/assets/json/hero.json'),

//       ),
//     );
//     final content = file.readAsStringSync();
//     final List<dynamic> heroProducts = json.decode(content);
//     _heroProducts = heroProducts
//         .map((heroProduct) => HeroProduct.fromMap(heroProduct))
//         .toList();
//     notifyListeners();
//   }
// }
