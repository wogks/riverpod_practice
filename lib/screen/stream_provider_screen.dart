import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpodpractice/layout/default_layout.dart';
import 'package:riverpodpractice/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: 'Stream Provider',
        body: Center(
          child: state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
