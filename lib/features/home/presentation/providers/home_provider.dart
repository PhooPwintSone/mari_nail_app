import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
