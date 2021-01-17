import 'package:flutter/widgets.dart';

class CategoryData extends ChangeNotifier {
  String category;
  bool clicked = false;

  void selectCategory(value) {
    clicked = true;
    category = value;
    notifyListeners();
  }

  void userOut() {
    clicked = false;
    notifyListeners();
  }
}
