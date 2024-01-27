import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../core/init/notifier/hive_notifier.dart';
import '../../product/card/my_card.dart';
import '../model/note_model.dart';
import 'package:provider/provider.dart';

class HiveService {
  Future<List> fetchNotes(BuildContext context, Box<NoteModel>? box) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    if (box != null) {
      List listNotes = await box.values.toList();
      return listNotes;
    } else {
      List listNotes = [];
      return listNotes;
    }
  }

  Future<List<MyCard>> myCardList(
      BuildContext context, Box<NoteModel>? box) async {
    List listNotes = await fetchNotes(context, box);

    List<MyCard> listMyCard = [];
    for (int i = 0; i < listNotes.length; i++) {
      listMyCard.add(MyCard(
        model: listNotes[i],
      ));
    }

    return listMyCard;
  }

  void addNotes(
      BuildContext context, NoteModel model, Box<NoteModel>? box) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    await box?.put(model.id, model);
    ChangeNotifier();
  }
}
