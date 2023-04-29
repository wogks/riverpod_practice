import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

//쇼핑아이템 모델에 카피위드 함수 만든 후에 적용
  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

//쇼핑아이템 모델에 카피위드 함수 만든 후에 적용
  toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
