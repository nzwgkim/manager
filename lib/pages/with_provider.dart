import 'package:flutter/material.dart';
import 'package:manager/simple_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    print('>>> WithProvider');
    final simpleProvider = Provider.of<SimpleProvider>(context);
    const TextStyle style = TextStyle(fontSize: 20);
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text('${simpleProvider.count}',
            //     style: style, textAlign: TextAlign.center),
            Consumer<SimpleProvider>(
              builder: (context, ref, child) {
                return Text('${ref.count}',
                    style: style, textAlign: TextAlign.center);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  simpleProvider.increase();
                },
                child: const Text(
                  'Increase Provider',
                  style: style,
                ))
          ]),
    );
  }
}
