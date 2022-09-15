import 'package:flutter/cupertino.dart';

class CurrentPage extends ChangeNotifier {
  int _currentPage = 0;
  int _currentCategory = 0;

  int get currentPage => _currentPage;
  int get currentCategory => _currentCategory;

  setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }

  setCurrentCategory(int selectedCategory) {
    _currentCategory = selectedCategory;
    notifyListeners();
  }
}
