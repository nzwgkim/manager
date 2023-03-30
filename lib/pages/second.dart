import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../states/simple_provider.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 20);
    final simpleProvider = Provider.of<SimpleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(Get.parameters['param'] ?? 'Second',
                style: style, textAlign: TextAlign.center),
            Text(Get.parameters['aaa'] ?? 'Second',
                style: style, textAlign: TextAlign.center),
            Text(Get.parameters['bbb'] ?? 'Second',
                style: style, textAlign: TextAlign.center),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Back',
                  style: style,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              simpleProvider.count.toString(),
              style: style,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  simpleProvider.increase();
                },
                child: const Text(
                  'Increase',
                  style: style,
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
                child: const Text('ButtomSheet',
                    style: style, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
