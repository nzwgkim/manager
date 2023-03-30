import 'package:flutter/material.dart';
import 'package:manager/pages/with_getx.dart';
import 'package:manager/pages/with_provider.dart';

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
                child: WithGetX(),
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
