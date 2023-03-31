import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/pages/dependancy/dependancy_manage_page.dart';
import 'package:provider/provider.dart';

import 'pages/binding_page.dart';
import 'pages/dependancy/depandancy_controller.dart';
import 'pages/first.dart';
import 'pages/second.dart';
import 'pages/third.dart';
import 'scrollables/rainbow_custom_scrollview.dart';
import 'scrollables/rainbow_gridview.dart';
import 'scrollables/rainbow_reorderable_listview.dart';
import 'scrollables/scrollable.dart';
import 'states/controller_reactive_getx.dart';
import 'states/controller_simple_getx.dart';
import 'states/simple_provider.dart';
import 'states/reactive_state.dart';
import 'states/simple_state.dart';

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
        // GetPage(name: '/Second', page: () => const Second()),
        GetPage(name: '/Third', page: () => const Third()),
        GetPage(
          name: '/binding',
          page: () => const BindingPage(),
          binding: BindingsBuilder(
            () {
              Get.put(DependancyController());
            },
          ),
        )
      ],
    );
  }
}

class Home extends StatelessWidget {
  // var num = 1.obs;
  // final reactiveGetX = Get.put(ReactiveGetX());
  final controllerSimpleGetX = Get.put(ControllerSimpleGetX());
  final controllerReactiveGetX = Get.put(ControllerReactiveGetX());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() => Text(
            //       'Reactive: ${reactiveGetX.count}',
            //       style: style,
            //       textAlign: TextAlign.center,
            //     )),
            // ElevatedButton(
            //     onPressed: () {
            //       reactiveGetX.increase();
            //     },
            //     child: Text(
            //       'Increase ReactiveGetX',
            //       style: style.copyWith(color: Colors.yellow),
            //     )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => First());
                  // Get.toNamed('/First');
                  // Navigator.of(context).pushNamed('/First');
                },
                child: const Text(
                  'First',
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  // parameter 전달하는 방법
                  Get.toNamed('/Second/3456?aaa=qq&bbb=19df');
                },
                child: const Text(
                  '/Second/3456?aaa=qq&bbb=19df',
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Third?id=woody');
                },
                child: Text(
                  '/Third?id=woody',
                  style: style.copyWith(color: Colors.red),
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const SimpleState());
                },
                child: Text(
                  'SimpleState',
                  style: style.copyWith(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const ReactiveState());
                },
                child: Text(
                  'ReactiveState',
                  style: style.copyWith(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const DependancyManagePage());
                },
                child: Text(
                  'DependancyManagePage',
                  style: style.copyWith(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/binding');
                },
                child: Text(
                  'Binding',
                  style: style.copyWith(color: Colors.white),
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
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowListView(title: 'RainbowListView'));
                },
                child: const Text(
                  'RainbowListView',
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowReorderableListView(
                      title: 'RainbowReorderableListView'));
                },
                child: const Text(
                  'RainbowReorderableListView',
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const RainbowGridView(title: 'RainbowGridView'));
                },
                child: const Text(
                  'RainbowGridView',
                  style: style,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => RainbowCustomScrollView(
                      title: 'RainbowCustomScrollView'));
                },
                child: const Text(
                  'RainbowCustomScrollView',
                  style: style,
                )),
          ],
        ),
      ),
    );
  }
}
