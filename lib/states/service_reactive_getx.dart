import 'package:get/get.dart';

// class ControllerReactiveGetX extends GetxController
class ServiceReactiveGetX extends GetxService {
  RxInt _count = 3000.obs;
  get count => _count;

  increase() {
    _count++;
  }

  setNumber(value) {
    _count(value);
  }

  late Worker workerOnce, workerEver;

  @override
  void onInit() {
    workerOnce = ever(_count, (value) => print('ever'));
    super.onInit();
  }
}
