import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/appbar/application_appbar.dart';
import '../../../product/card/my_card.dart';
import '../../../product/grid/my_grid_view.dart';
import '../../add_notes_page/view/add_notes_view.dart';
import '../../drawer/application_drawer.dart';
import '../../home/viewmodel/home_view_model.dart';
import '../../search_view/view/search_view.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuilder: (context, viewModel) {
        return FutureBuilder<List>(
          future: viewModel.myCardList(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            } else {
              List<MyCard> list = [];
              for (int i = 0; i < snapshot.data!.length; i++) {
                if (snapshot.data?[i].model.favorite) {
                  list.add(snapshot.data?[i]);
                }
              }
              list = list.reversed.toList();
              print(list.length);
              return Scaffold(
                appBar:
                    ApplicationAppBar(title: LocaleKeys.favorites, actions: [
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
                floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNotesView()));
                    }),
              );
            }
          },
        );
      },
    );
  }
}
