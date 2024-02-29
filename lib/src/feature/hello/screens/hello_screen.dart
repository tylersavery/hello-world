import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helloworld/src/feature/hello/components/hello_container.dart';
import 'package:helloworld/src/feature/hello/providers/hello_provider.dart';

class HelloScreen extends ConsumerWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(helloProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const HelloContainer(),
    );
  }
}
