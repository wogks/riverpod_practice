import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/layout/default_layout.dart';
import 'package:riverpodpractice/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    //이닛 스테이트에서는 워치 금지
    tabController = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //리슨은 디스포즈를 할 필요가 없다
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        tabController.animateTo(next);
      }
    });
    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: List.generate(
            10,
            (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      index.toString(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(listenProvider.notifier)
                            .update((state) => state == 10 ? 10 : state + 1);
                      },
                      child: const Text('다음'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(listenProvider.notifier)
                            .update((state) => state == 0 ? 0 : state - 1);
                      },
                      child: const Text('뒤로'),
                    ),
                  ],
                )),
      ),
    );
  }
}
