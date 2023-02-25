import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/main.dart';
import 'package:provider/provider.dart';

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
