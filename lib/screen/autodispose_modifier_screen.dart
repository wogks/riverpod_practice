import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/layout/default_layout.dart';
import 'package:riverpodpractice/riverpod/autodispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autodisposeModifierProvider);
    return DefaultLayout(
        title: 'AutodisposeProvider',
        body: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
