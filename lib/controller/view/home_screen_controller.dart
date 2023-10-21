import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;

  /// provide the scrolling functionality to the hero container
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
