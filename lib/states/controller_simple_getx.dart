import 'package:get/get.dart';

class ControllerSimpleGetX extends GetxController {
  int _count = 700;
  get count => _count;

  increase() {
    _count++;
    update();
  }
}
