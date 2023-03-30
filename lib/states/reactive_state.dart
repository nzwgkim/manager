import 'package:flutter/material.dart';
import 'package:manager/states/with_provider.dart';

import 'with_reactive_getx.dart';

class ReactiveState extends StatelessWidget {
  const ReactiveState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Reactive State',
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: WithReactiveGetX(),
              ),
              const Expanded(
                child: WithProvider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
