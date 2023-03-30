import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class User {
  final int id;
  final String name;
  User({required this.id, required this.name});
}

class First extends StatelessWidget {
  First({super.key});

  final Rx<User> user1 = User(id: 2, name: 'Family').obs;

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const Home());
                },
                child: const Text('Home',
                    style: style, textAlign: TextAlign.center)),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Third', arguments: user1);

                  /// 자신(First)를 없애고, 바로 Third로 이동...
                  /// Third에서 back하면 First가 아닌, Home으로 이동한다.
                  // Get.offNamed('/Third');
                },
                child: const Text(
                  'Second with Class argument',
                  style: style,
                )),

            ///--------Something
            Obx(() => Text(
                  'User Class: ${user1.value.id} && ${user1.value.name}',
                  style: style.copyWith(color: Colors.blue),
                  textAlign: TextAlign.center,
                )),

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
