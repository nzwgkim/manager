import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../simple_getx.dart';

class WithReactiveGetX extends StatelessWidget {
  WithReactiveGetX({super.key});

  final SimpleGetX simpleGetX = Get.find<SimpleGetX>();
  final ReactiveGetX reactiveGetX = Get.find<ReactiveGetX>();

  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    print('>>> WithReactiveGetX');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Text: ${reactiveGetX.count}',
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
