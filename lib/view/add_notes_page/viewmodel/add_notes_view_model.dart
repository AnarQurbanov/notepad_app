import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/init/notifier/hive_notifier.dart';
import '../../model/note_model.dart';

class AddNotesViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  bool favorite = false;

  void favoriteFunc() {
    favorite = !favorite;
  }

  void addNotes(BuildContext context, NoteModel model) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    await Provider.of<HiveNotifier>(context, listen: false)
        .notesBox
        ?.put(model.id, model);
    ChangeNotifier();
  }
}
