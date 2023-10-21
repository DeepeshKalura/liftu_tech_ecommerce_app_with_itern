import 'package:flutter/material.dart';

import '../../model/product/product.dart';
import '../api/platzi_api.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;
  bool isLoading = false;
  List<Product> search = [];

  /// provide the scrolling functionality to the hero container
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  /// making the page loading functionality

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  /// when person search then they will get the loading screen as well as the result afterr the api
  /// call
  ///

  Future<void> searchProduct(String query) async {
    final searched = await PlatziApi().getProductsBySearch(query);
    search += searched;
    notifyListeners();
  }
}
