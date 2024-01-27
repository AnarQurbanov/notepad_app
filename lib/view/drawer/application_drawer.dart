import 'package:flutter/material.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../../product/drawer/drawer_header.dart';
import '../trash_page/view/deleted_notes_view.dart';
import '../favorite_page/view/favorite_page_view.dart';
import '../home/view/home_view.dart';

class ApplicationDrawer {
  final BuildContext context;
  ApplicationDrawer({required this.context});
  Drawer get drawer => Drawer(
        child: Column(
          children: [
            MyDrawerHeader(),
            ListTileButton(
                Icon(Icons.home), Text(LocaleKeys.allNotes), HomeView()),
            ListTileButton(Icon(Icons.favorite), Text(LocaleKeys.favorites),
                FavoritePageView()),
            ListTileButton(
                Icon(Icons.delete), Text(LocaleKeys.trash), DeletedNotesView()),
          ],
        ),
      );
  Material ListTileButton(Icon icon, Text text, Widget page) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ));
        },
        child: ListTile(
          leading: icon,
          title: text,
        ),
      ),
    );
  }
}
