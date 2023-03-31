import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/pages/dependancy/my_get_lazyput.dart';
import 'package:manager/pages/dependancy/my_get_put.dart';

import 'depandancy_controller.dart';

class DependancyManagePage extends StatelessWidget {
  const DependancyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependancy Management'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => Get.to(
                        () => const MyGetPut(),
                        binding: BindingsBuilder(
                          () {
                            Get.put(DependancyController());
                          },
                        ),
                      ),
                  child: const Text('Get.put', style: style)),
              ElevatedButton(
                  onPressed: () => Get.to(
                        () => const MyGetLazyPut(),
                        binding: BindingsBuilder(
                          () {
                            Get.lazyPut<DependancyController>(
                              () => DependancyController(),
                            );
                          },
                        ),
                      ),
                  child: const Text('Get.lazyPut', style: style)),
              ElevatedButton(
                  onPressed: () => Get.to(
                        () => const MyGetPut(),
                        binding: BindingsBuilder(
                          () {
                            Get.putAsync<DependancyController>(
                                () async => DependancyController());
                          },
                        ),
                      ),
                  child: const Text('Get.putAsync', style: style)),
              ElevatedButton(
                  onPressed: () => null,
                  child: const Text('name', style: style)),
            ],
          ),
        ),
      ),
    );
  }
}
