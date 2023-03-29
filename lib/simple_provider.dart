import 'package:flutter/material.dart';

class SimpleProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increase() {
    _count++;
    notifyListeners();
  }
}
