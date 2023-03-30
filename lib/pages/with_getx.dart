import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../simple_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({super.key});

  final simpleGetX = Get.put(SimpleGetX());
  final reactiveGetX = Get.put(ReactiveGetX());

  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    print('>>> WithGetX');
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Simple: ${simpleGetX.count}',
                style: style, textAlign: TextAlign.center),
            GetBuilder<SimpleGetX>(
              builder: (controller) => Text('GetBuilder: ${controller.count}',
                  style: style, textAlign: TextAlign.center),
            ),
            ElevatedButton(
                onPressed: () {
                  simpleGetX.increase();
                  print(simpleGetX.count.toString());
                },
                child: Text(
                  'Increase SimpleGetX',
                  style: style,
                )),
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
