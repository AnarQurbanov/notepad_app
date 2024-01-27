import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/appbar/application_appbar.dart';
import '../../../product/card/my_card.dart';
import '../../../product/grid/my_grid_view.dart';
import '../../search_view/view/search_view.dart';
import '../viewmodel/deleted_notes_view_model.dart';
import '../../drawer/application_drawer.dart';

class DeletedNotesView extends StatefulWidget {
  const DeletedNotesView({super.key});

  @override
  State<DeletedNotesView> createState() => _DeletedNotesViewState();
}

class _DeletedNotesViewState extends State<DeletedNotesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DeletedNotesViewModel>(
      viewModel: DeletedNotesViewModel(),
      onPageBuilder: (context, viewModel) {
        return FutureBuilder<List>(
          future: viewModel.myCardList(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            } else {
              List<MyCard> list = [];
              for (int i = 0; i < snapshot.data!.length; i++) {
                list.add(snapshot.data?[i]);
              }
              list = list.reversed.toList();
              print(list.length);
              return Scaffold(
                appBar: ApplicationAppBar(title: LocaleKeys.trash, actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchView(list: list)));
                    },
                  )
                ]).applicationAppBar,
                body: MyGridView(myCardList: list),
                drawer: ApplicationDrawer(context: context).drawer,
              );
            }
          },
        );
      },
    );
  }
}
