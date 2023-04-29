import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProfierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 1));
  return List.generate(5, (index) => index * data);
});
