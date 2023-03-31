import 'package:get/get.dart';

class DependancyController extends GetxController {
  static DependancyController get to => Get.find();
  RxInt _count = 0.obs;

  get count => _count;

  increase() {
    _count++;
  }

  @override
  void onInit() {
    ever(_count, (callback) => print('ever'));
    super.onInit();
  }
}
