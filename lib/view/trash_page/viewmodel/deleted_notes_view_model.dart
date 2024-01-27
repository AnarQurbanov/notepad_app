import 'package:flutter/material.dart';
import '../../../core/init/notifier/hive_notifier.dart';
import '../../../product/card/my_card.dart';
import 'package:provider/provider.dart';

class DeletedNotesViewModel {
  Future<List> fetchNotes(BuildContext context) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    if (Provider.of<HiveNotifier>(context, listen: false).trashNotesBox !=
        null) {
      List listNotes = await Provider.of<HiveNotifier>(context, listen: false)
          .trashNotesBox!
          .values
          .toList();
      return listNotes;
    } else {
      List listNotes = [];
      return listNotes;
    }
  }

  Future<List<MyCard>> myCardList(BuildContext context) async {
    List listNotes = await fetchNotes(context);

    List<MyCard> listMyCard = [];
    for (int i = 0; i < listNotes.length; i++) {
      listMyCard.add(MyCard(
        model: listNotes[i],
      ));
    }

    return listMyCard;
  }
}
