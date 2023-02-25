import 'package:flutter/material.dart';

class SimpleCountProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increase() {
    _count++;
    notifyListeners();
  }
}

// class SimpleCountGetX extends GetxController {
//   RxInt _count = 0.obs;
//   RxInt get count => _count;

//   increase() {
//     _count++;
//   }
// }
