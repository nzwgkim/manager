import 'package:flutter/material.dart';

import '../const/colors.dart';

Widget renderContainer({required Color color, required int index}) {
  print('render# $index');
  return Container(
    height: 200,
    color: color,
    alignment: Alignment.center,
    child: Text(
      index.toString(),
      style: const TextStyle(fontSize: 30),
    ),
  );
}

class RainbowListView extends StatelessWidget {
  final String title;
  const RainbowListView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
          // itemBuilder: (context, index) => renderContainer(
          //     color: colors[index % colors.length], index: index),
          itemBuilder: (context, index) => Text(
            index.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          itemCount: 100,
          separatorBuilder: (context, index) => const SizedBox(
            height: 5,
          ),
        ));
  }
}

class Rainbow extends StatelessWidget {
  final items = List.generate(100, (index) => index);
  Rainbow({super.key});

  @override
  Widget build(BuildContext context) {
    // int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rainbow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items
              .map((e) =>
                  renderContainer(color: colors[e % colors.length], index: e))
              .toList(),
        ),
      ),
    );
  }
}
