import 'package:mobx/mobx.dart';

import '../../../product/card/my_card.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store {
  @observable
  List<MyCard> items = [];

  @action
  void findAndSet(String key, List<MyCard> list) {
    items = list
            .where((element) =>
                element.model.title!
                    .toLowerCase()
                    .contains(key.toLowerCase()) ??
                false)
            .toList() ??
        [];
  }
}
