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

  @override
  void onInit() {
    ever(
        _count,
        (callback) => print(
              'ever $_count',
            ),
        condition: () => _count() < 10); // 값이 바뀔때 마다 항상 실행됨.
    // once(_count, (callback) => print('once')); // 한번만 실행됨
    // debounce(_count, (callback) => print('once'),
    //     time: const Duration(seconds: 3)); // 최종입력후 timer 이후 실행됨.
    // super.onInit();
  }
}
