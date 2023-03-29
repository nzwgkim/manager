import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/scrollable.dart';
import 'package:manager/third.dart';
import 'package:provider/provider.dart';

import 'first.dart';
import 'second.dart';
import 'simple_getx.dart';
import 'simple_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SimpleProvider>(
        create: (context) => SimpleProvider(), child: const MyHome()),
  );
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/First', page: () => First()),
        GetPage(name: '/Second/:param', page: () => const Second()),
        GetPage(name: '/Third', page: () => const Third()),
      ],
    );
  }
}

class Home extends StatelessWidget {
  // var num = 1.obs;
  final control = Get.put(SimpleGetX());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => Text(
                  '${control.count}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
                onPressed: () {
                  control.increase();
                },
                child: const Text(
                  'Increase',
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => First());
                },
                child: const Text(
                  'First',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Second/Hi');
                },
                child: const Text(
                  'Second(Param)',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Third?id=woody');
                },
                child: const Text(
                  'Third',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Rainbow());
                },
                child: const Text(
                  'Rainbow',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowListView(title: 'RainbowListView'));
                },
                child: const Text(
                  'RainbowListView',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowReorderableListView(
                      title: 'RainbowReorderableListView'));
                },
                child: const Text(
                  'RainbowReorderableListView',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowGridView(title: 'RainbowGridView'));
                },
                child: const Text(
                  'RainbowGridView',
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => RainbowCustomScrollView(
                      title: 'RainbowCustomScrollView'));
                },
                child: const Text(
                  'RainbowCustomScrollView',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
