import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helloworld/src/feature/hello/components/hello_text.dart';
import 'package:helloworld/src/feature/hello/providers/hello_provider.dart';

class HelloContainer extends ConsumerWidget {
  const HelloContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(helloProvider);

    return data.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
      data: (result) {
        return result.fold(
          (error) => Center(child: Text(error)),
          (article) => Center(
            child: HelpText(
              article: article,
            ),
          ),
        );
      },
    );
  }
}
