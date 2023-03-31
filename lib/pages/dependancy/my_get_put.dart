import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'depandancy_controller.dart';

class MyGetPut extends GetView<DependancyController> {
  const MyGetPut({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyGetPut'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => Text(
                  controller.count.toString(),
                  style: style.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
                onPressed: () => controller.increase(),
                child: const Text(
                  'Increase',
                  style: style,
                ))
          ],
        ),
      ),
    );
  }
}
