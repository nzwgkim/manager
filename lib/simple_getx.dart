import 'package:get/get.dart';

class SimpleGetX extends GetxController {
  RxInt _count = 1000.obs;
  get count => _count;

  increase() {
    _count++;
  }
}
