import 'package:flutter/material.dart';
import 'package:manager/states/with_simple_getx.dart';
import 'package:manager/states/with_provider.dart';

class SimpleState extends StatelessWidget {
  const SimpleState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Simple State',
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: WithSimpleGetX(),
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
