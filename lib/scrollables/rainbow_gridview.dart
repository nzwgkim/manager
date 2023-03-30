import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'scrollable.dart';

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
            renderContainer(color: colors[index % 7], index: index),
        itemCount: 300,
      ),
      // GridView.count(
      //   crossAxisCount: 2,
      //   children: colors.map((e) => renderContainer(color: e)).toList(),
      // ),
    );
  }
}
