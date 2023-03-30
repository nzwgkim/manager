import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'simple_getx.dart';

class WithSimpleGetX extends StatelessWidget {
  WithSimpleGetX({super.key});

  // final simpleGetX = Get.put(SimpleGetX());
  final SimpleGetX simpleGetX = Get.find<SimpleGetX>();
  final ReactiveGetX reactiveGetX = Get.find<ReactiveGetX>();

  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    print('>>> WithSimpleGetX');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Text: ${simpleGetX.count}',
                style: style, textAlign: TextAlign.center),
            GetBuilder<SimpleGetX>(
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
                  print(simpleGetX.count.toString());
                },
                child: Text(
                  'Increase SimpleGetX',
                  style: style,
                )),
          ]),
    );
  }
}
