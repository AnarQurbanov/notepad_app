import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../product/card/my_card.dart';
import '../viewmodel/search_view_model.dart';

class SearchView extends StatefulWidget {
  final List<MyCard> list;

  const SearchView({super.key, required this.list});
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: SearchViewModel(),
        onPageBuilder: (context, viewModel) {
          return Scaffold(
              appBar: AppBar(
                title: TextField(
                  onChanged: (value) {
                    viewModel.findAndSet(value, widget.list);
                    print(
                        "-----------------------------------------------------------------------");
                    print(viewModel.items.length);
                  },
                ),
              ),
              body: GridView.count(
                crossAxisCount: 2,
                padding: context.paddingLow,
                children: viewModel.items,
              ));
        });
  }
}
