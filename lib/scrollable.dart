import 'package:flutter/material.dart';

final colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

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
    int i = 0;
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
