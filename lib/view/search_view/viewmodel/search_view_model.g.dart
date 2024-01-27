// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_SearchViewModelBase.items', context: context);

  @override
  List<MyCard> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<MyCard> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_SearchViewModelBaseActionController =
      ActionController(name: '_SearchViewModelBase', context: context);

  @override
  void findAndSet(String key, List<MyCard> list) {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase.findAndSet');
    try {
      return super.findAndSet(key, list);
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
