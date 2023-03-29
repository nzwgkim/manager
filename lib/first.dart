import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'simple_getx.dart';
import 'simple_provider.dart';

class User {
  final int id;
  final String name;
  User({required this.id, required this.name});
}

class First extends StatelessWidget {
  First({super.key});

  final SimpleGetX control = Get.find();
  final user = User(id: 2, name: 'Family').obs;

  @override
  Widget build(BuildContext context) {
    final simpleProvider = Provider.of<SimpleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(control.count != 1000 ? '${control.count}' : 'First',
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Home());
                },
                child: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(simpleProvider.count.toString(),
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  simpleProvider.increase();
                },
                child: const Text(
                  'simpleProvider',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),

            ///--------Something
            Obx(() => Text('${user.value.id} && ${user.value.name}',
                style: const TextStyle(fontSize: 20))),

            // ElevatedButton(
            //     onPressed: () {
            //       user.update((user) {
            //         user.id = 99;
            //         user.name = 'okok';
            //       });
            //     },
            //     child: const Text(
            //       'simpleProvider',
            //       style: TextStyle(fontSize: 20),
            //     )),
          ],
        ),
      ),
    );
  }
}
