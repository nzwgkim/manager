import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/scrollable.dart';
import 'package:manager/state_managers.dart';
import 'package:provider/provider.dart';

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

class User {
  final id;
  final name;
  User({required this.id, required this.name});
}

class SimpleGetX extends GetxController {
  var _count = 1000.obs;
  get count => _count;

  increase() {
    _count++;
  }
}

class SimpleProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increase() {
    _count++;
    notifyListeners();
  }
}

class Home extends StatelessWidget {
  // var num = 1.obs;
  var control = Get.put(SimpleGetX());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
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
                'Second',
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
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Rainbow());
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
                Get.to(() =>
                    RainbowCustomScrollView(title: 'RainbowCustomScrollView'));
              },
              child: const Text(
                'RainbowCustomScrollView',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
