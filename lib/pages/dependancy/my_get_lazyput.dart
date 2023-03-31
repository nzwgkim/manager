import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/pages/dependancy/depandancy_controller.dart';

class MyGetLazyPut extends StatelessWidget {
  const MyGetLazyPut({super.key});

  Widget myText(String msg) {
    return Text(
      msg,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyGetLazyPut'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myText("${Get.find<DependancyController>().count}"),
            Obx(() => myText("${Get.find<DependancyController>().count}")),
            Obx(() => myText("${DependancyController.to.count}")),
            ElevatedButton(
                // onPressed: () => Get.find<DependancyController>().increase(),
                onPressed: () => DependancyController.to.increase(),
                child: myText('Increase')),
          ],
        ),
      )),
    );
  }
}
