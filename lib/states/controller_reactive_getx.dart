import 'package:get/get.dart';

class ControllerReactiveGetX {
  RxInt _count = 3000.obs;
  get count => _count;

  increase() {
    _count++;
  }
}
