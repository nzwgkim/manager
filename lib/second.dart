import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'simple_provider.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    final simpleProvider = Provider.of<SimpleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.parameters['param'] ?? 'Second',
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(simpleProvider.count.toString(),
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  simpleProvider.increase();
                },
                child: const Text(
                  'Increase',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.yellow,
                    height: 100,
                    child:
                        Column(children: const [Text('Hi'), Text('Flutter!')]),
                  ));
                },
                child: const Text(
                  'ButtomSheet',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
