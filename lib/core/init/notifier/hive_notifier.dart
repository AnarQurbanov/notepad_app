import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../constants/app/app_constants.dart';
import '../../../view/model/note_model.dart';

class HiveNotifier extends ChangeNotifier {
  Box<NoteModel>? _notesBox;
  Box<NoteModel>? _trashNotesBox;

  HiveNotifier() {
    _notesBox?.close();
    _trashNotesBox?.close();
    initNotesBox();
  }

  Future<void> initNotesBox() async {
    if (_notesBox == null) {
      Hive.initFlutter();
      _notesBox = await Hive.openBox(ApplicationConstants.NOTES_BOX);
    }
    if (_trashNotesBox == null) {
      _trashNotesBox = await Hive.openBox(ApplicationConstants.TRASH_NOTES);
    }
    // if (!(_notesBox?.isOpen ?? true)) {
    //   _notesBox = await Hive.openBox("zxc");
    //   print(_notesBox?.length);
    // }
  }

  Box<NoteModel>? get notesBox => _notesBox;
  Box<NoteModel>? get trashNotesBox => _trashNotesBox;
}
