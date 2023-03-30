import 'package:get/get.dart';

class ControllerReactiveGetX extends GetxController {
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
  Future<void> onInit() async {
    workerOnce = once(_count, (value) {
      print("counter reached $value before 3 seconds.");
    });
    // 3.delay(workerOnce.dispose);
    3.delay(() => print('3 second delay...'));
    workerEver = ever(_count, (callback) => print('Ever... $_count'),
        condition: () => _count() > 10);
  }
}
