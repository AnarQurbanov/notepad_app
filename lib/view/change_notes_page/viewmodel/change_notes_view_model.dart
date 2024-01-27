import 'package:flutter/material.dart';
import '../../../core/init/notifier/hive_notifier.dart';
import '../../model/note_model.dart';
import 'package:provider/provider.dart';

class ChangeNotesViewModel {
  final NoteModel model;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  ChangeNotesViewModel({required this.model}) {
    titleController = TextEditingController(text: model.title);
    noteController = TextEditingController(text: model.subTitle);
  }

  void deleteNote(BuildContext context) async {
    model.deleted = true;

    await Future.wait([
      Provider.of<HiveNotifier>(context, listen: false).initNotesBox(),
      Provider.of<HiveNotifier>(context, listen: false)
              .trashNotesBox
              ?.put(model.id, model) ??
          Future.value(null),
      Provider.of<HiveNotifier>(context, listen: false)
              .notesBox
              ?.delete(model.id) ??
          Future.value(null),
    ]);

    ChangeNotifier();
  }

  void deleteTrashNote(
    BuildContext context,
  ) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    await Provider.of<HiveNotifier>(context, listen: false)
        .trashNotesBox
        ?.delete(model.id);

    ChangeNotifier();
  }

  void changeNotes(BuildContext context, NoteModel model) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    await Provider.of<HiveNotifier>(context, listen: false)
        .notesBox
        ?.put(model.id, model);
    ChangeNotifier();
  }
}
