import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../card/my_card.dart';

class MyGridView extends StatefulWidget {
  final List<MyCard> myCardList;

  const MyGridView({super.key, required this.myCardList});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: context.paddingLow,
      children: widget.myCardList,
    );
  }
}
