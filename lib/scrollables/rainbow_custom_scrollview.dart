import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'scrollable.dart';

class RainbowCustomScrollView extends StatelessWidget {
  List<int> totnum = List.generate(10, (index) => index);
  final String title;
  RainbowCustomScrollView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
          ),
          // renderSliverList(),
          // renderSliverListBuild(),
          SliverGrid.builder(
            //SliverGridDelegateWithMaxCrossAxisExtent: 모르겠다.
            // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 150,
            // ),
// SliverGridDelegateWithFixedCrossAxisCount:가로로 몇개의 grid를 만들지 정한다.
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => renderContainer(
                color: colors[index % colors.length], index: index),
            itemCount: 100,
          )
          // GridView.count(
          //   crossAxisCount: 2,
          //   children: colors.map((e) => renderContainer(color: e)).toList(),
          // ),
        ],
      ),
    );
  }

  SliverList renderSliverList() {
    return SliverList(
        delegate: SliverChildListDelegate(totnum
            .map((e) =>
                renderContainer(color: colors[e % colors.length], index: e))
            .toList()));
  }

  SliverList renderSliverListBuild() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => renderContainer(
                color: colors[index % colors.length], index: index),
            childCount: colors.length));
  }
}
