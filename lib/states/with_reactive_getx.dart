import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_reactive_getx.dart';
import 'controller_simple_getx.dart';

class WithReactiveGetX extends StatelessWidget {
  WithReactiveGetX({super.key});

  final ControllerSimpleGetX simpleGetX = Get.find<ControllerSimpleGetX>();
  final ControllerReactiveGetX reactiveGetX =
      Get.find<ControllerReactiveGetX>();

  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    print('>>> WithReactiveGetX');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('reactiveGetX: ${reactiveGetX.count}',
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
                  reactiveGetX.increase();
                },
                child: Text(
                  'Increase ReactiveGetX',
                  style: style.copyWith(color: Colors.yellow),
                )),
          ]),
    );
  }
}
