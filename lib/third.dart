import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'simple_provider.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    final simpleProvider = Provider.of<SimpleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third', style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.parameters['id'] ?? 'Third',
                style: const TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/');
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
            ElevatedButton(
                onPressed: () {
                  simpleProvider.increase();
                },
                child: const Text(
                  'Increase',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
