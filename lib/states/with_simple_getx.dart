import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_reactive_getx.dart';
import 'controller_simple_getx.dart';

class WithSimpleGetX extends StatelessWidget {
  WithSimpleGetX({super.key});

  final ControllerSimpleGetX simpleGetX = Get.find<ControllerSimpleGetX>();
  final ControllerReactiveGetX reactiveGetX =
      Get.find<ControllerReactiveGetX>();

  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    print('>>> WithSimpleGetX');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('simpleGetX: ${simpleGetX.count}',
                style: style, textAlign: TextAlign.center),
            GetBuilder<ControllerSimpleGetX>(
              builder: (controller) => Text('GetBuilder: ${controller.count}',
                  style: style, textAlign: TextAlign.center),
            ),
            Obx(() => Text(
                  'Reactive: ${reactiveGetX.count}',
                  style: style,
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
                onPressed: () {
                  simpleGetX.increase();
                },
                child: Text(
                  'Increase SimpleGetX',
                  style: style.copyWith(color: Colors.yellow),
                )),
            ElevatedButton(
                onPressed: () {
                  simpleGetX.setNumber(777);
                },
                child: Text(
                  'Set Number',
                  style: style.copyWith(color: Colors.yellow),
                )),
          ]),
    );
  }
}
