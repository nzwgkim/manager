import 'package:flutter/material.dart';
import 'package:manager/simple_count_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SimpleStateManagement extends StatelessWidget {
  const SimpleStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleState'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ChangeNotifierProvider<SimpleCountProvider>(
                    create: (context) => SimpleCountProvider(),
                    child: const WithProvider())),
            Expanded(child: WithGetX()),
          ],
        ),
      ),
    );
  }
}

class WithProvider extends StatelessWidget {
  const WithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final simpleControl = Provider.of<SimpleCountProvider>(context);
    return Center(
      child: Column(
        children: [
          Text(
            '${simpleControl.count}',
            style: const TextStyle(fontSize: 30),
          ),
          _button(simpleControl: simpleControl),
          const Text('WithProvidor'),
        ],
      ),
    );
  }
}

class _button extends StatelessWidget {
  const _button({
    required this.simpleControl,
  });

  final SimpleCountProvider simpleControl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        simpleControl.increase();
      },
      child: const Text(
        '+',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class SimpleCountGetX extends GetxController {
  RxInt _count = 0.obs;
  RxInt get count => _count;

  increase() {
    _count++;
  }
}

class WithGetX extends StatelessWidget {
  WithGetX({super.key});
  final control = Get.put(SimpleCountGetX);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            '222',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                '+',
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
