import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class SimpleGeX extends GetxController {
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

final colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

Widget renderContainer({required Color color}) {
  return Container(
    height: 300,
    color: color,
  );
}

class Home extends StatelessWidget {
  // var num = 1.obs;
  var control = Get.put(SimpleGeX());

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
        ],
      ),
    );
  }
}

class RainbowGridView extends StatelessWidget {
  final String title;
  const RainbowGridView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100),
        itemBuilder: (context, index) =>
            renderContainer(color: colors[index % 7]),
        itemCount: 300,
      ),
      // GridView.count(
      //   crossAxisCount: 2,
      //   children: colors.map((e) => renderContainer(color: e)).toList(),
      // ),
    );
  }
}

class RainbowReorderableListView extends StatefulWidget {
  final String title;
  const RainbowReorderableListView({required this.title, super.key});

  @override
  State<RainbowReorderableListView> createState() =>
      _RainbowReorderableListViewState();
}

class _RainbowReorderableListViewState
    extends State<RainbowReorderableListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ReorderableListView.builder(
          itemBuilder: (context, index) =>
              reoderableRenderContainer(color: colors[index], index: index),
          itemCount: colors.length,
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex--;
            }
            setState(() {
              final item = colors.removeAt(oldIndex);
              colors.insert(newIndex, item);
            });
          },

          // children: colors.map((e) => renderContainer(color: e)).toList()),
        ));
  }

  Widget reoderableRenderContainer({required int index, required Color color}) {
    return Container(
      key: Key(index.toString()),
      height: 100,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class RainbowListView extends StatelessWidget {
  final String title;
  const RainbowListView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
          itemBuilder: (context, index) =>
              renderContainer(color: colors[index]),
          itemCount: colors.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 5,
          ),
        ));
  }
}

class Rainbow extends StatelessWidget {
  const Rainbow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rainbow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: colors.map((e) => renderContainer(color: e)).toList(),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  First({super.key});

  final SimpleGeX control = Get.find();
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
