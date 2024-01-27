import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/appbar/application_appbar.dart';
import '../viewmodel/add_notes_view_model.dart';
import '../../home/view/home_view.dart';
import '../../model/note_model.dart';
import 'dart:math';
import 'dart:convert';

class AddNotesView extends StatefulWidget {
  const AddNotesView({super.key});
  @override
  createState() {
    return _AddNotesViewState();
  }
}

class _AddNotesViewState extends State<AddNotesView> {
  @override
  Widget build(BuildContext context) {
    context.theme.errorColor;
    return BaseView<AddNotesViewModel>(
      viewModel: AddNotesViewModel(),
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: ApplicationAppBar(title: "", actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: viewModel.favorite
                    ? context.theme.errorColor
                    : Colors.white,
              ),
              onPressed: () {
                viewModel.favoriteFunc();
                setState(() {});
              },
            )
          ]).applicationAppBar,
          body: Form(
            key: viewModel.formState,
            child: Padding(
              padding: context.paddingLow,
              child: ListView(
                children: [
                  inputTitleValueFunc(viewModel, context),
                  inputNoteValueTitle(viewModel, context),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () => addNoteFunction(context, viewModel),
          ),
        );
      },
    );
  }

  TextFormField inputNoteValueTitle(
      AddNotesViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.noteController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: LocaleKeys.note,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: context.textTheme.headline5!.fontSize,
        ),
      ),
      style: TextStyle(
        fontSize: context.textTheme.headline5!.fontSize,
      ),
    );
  }

  TextFormField inputTitleValueFunc(
      AddNotesViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.titleController,
      decoration: InputDecoration(
        hintText: LocaleKeys.title,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: context.textTheme.headline5!.fontSize,
            fontWeight: FontWeight.bold),
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: context.textTheme.headline5!.fontSize,
      ),
    );
  }

  void addNoteFunction(BuildContext context, dynamic viewModel) {
    print("*****************************************************");
    print(viewModel.titleController.text);
    print(viewModel.noteController.text);
    DateTime time = DateTime.now();
    print(
        "${time.hour} : ${time.minute} - ${time.day}:${time.month}:${time.year}");
    viewModel.addNotes(
      context,
      NoteModel(
        id: generateRandomId(20),
        title: viewModel.titleController.text,
        subTitle: viewModel.noteController.text,
        date:
            "${time.hour} : ${time.minute} - ${time.day}:${time.month}:${time.year}",
        favorite: viewModel.favorite,
        deleted: false,
      ),
    );
    setState(() {});
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeView()));
  }

  String generateRandomId(int length) {
    final random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(255));
    var randomString = base64Url.encode(values);

    return randomString;
  }
}
