import 'package:flutter/material.dart';

import '../const/colors.dart';

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
