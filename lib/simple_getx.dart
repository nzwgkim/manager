import 'package:get/get.dart';

class SimpleGetX extends GetxController {
  int _count = 100;
  get count => _count;

  increase() {
    _count++;
    update();
  }
}

class ReactiveGetX {
  RxInt _count = 1000.obs;
  get count => _count;

  increase() {
    _count++;
  }
}
