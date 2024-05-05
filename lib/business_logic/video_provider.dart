import 'package:flutter/material.dart';

class VideoProvider with ChangeNotifier {
  bool condition = false;

  swapScreen() {
    condition = !condition;
    notifyListeners();
  }

  resetCondition() {
    condition = false;
    notifyListeners();
  }
}
