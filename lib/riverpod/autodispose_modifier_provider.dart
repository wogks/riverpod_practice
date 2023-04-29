import 'package:flutter_riverpod/flutter_riverpod.dart';

//뒤로가기하면 캐시를 자동으로 삭제하고 다시 들어가면 다시 생성한다. 데이터를 사용하지 않을때는 자동으로 삭제된다
final autodisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return [1, 2, 3, 4, 5];
});
