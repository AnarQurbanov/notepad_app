import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/appbar/application_appbar.dart';
import '../viewmodel/change_notes_view_model.dart';
import '../../home/view/home_view.dart';
import '../../model/note_model.dart';
import '../../trash_page/view/deleted_notes_view.dart';

// ignore: must_be_immutable
class ChangeNotesView extends StatefulWidget {
  final NoteModel model;

  const ChangeNotesView(this.model);
  @override
  createState() {
    return _ChangeNotesViewState();
  }
}

class _ChangeNotesViewState extends State<ChangeNotesView> {
  late NoteModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangeNotesViewModel>(
      viewModel: ChangeNotesViewModel(model: widget.model),
      onPageBuilder: (context, viewModel) {
        return Scaffold(
            appBar: ApplicationAppBar(title: "", actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.model.favorite!
                      ? context.theme.errorColor
                      : Colors.white,
                ),
                onPressed: !viewModel.model.deleted! ? favoriteMethod : null,
              ),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: !widget.model.deleted!
                      ? () {
                          viewModel.deleteNote(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeView()));
                        }
                      : () {
                          viewModel.deleteTrashNote(context);
                          Navigator.of(context).pop();
                        }),
            ]).applicationAppBar,
            body: Form(
              key: viewModel.formState,
              child: Padding(
                padding: context.paddingLow,
                child: ListView(
                  children: [
                    inputTitleFunc(viewModel, context),
                    inputNoteFunc(viewModel, context),
                    SizedBox(height: context.height / 20),
                    Text(widget.model.date!),
                  ],
                ),
              ),
            ),
            floatingActionButton: !widget.model.deleted!
                ? FloatingActionButton(
                    child: Icon(Icons.check),
                    onPressed: () {
                      changeNoteFunction(context, viewModel);
                      setState(() {});
                    })
                : FloatingActionButton(
                    child: Icon(Icons.replay_outlined),
                    onPressed: () {
                      changeNoteFunction(context, viewModel);
                      viewModel.deleteTrashNote(context);
                      setState(() {});
                    }));
      },
    );
  }

  TextFormField inputNoteFunc(
      ChangeNotesViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.noteController,
      enabled: !viewModel.model.deleted!,
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

  TextFormField inputTitleFunc(
      ChangeNotesViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.titleController,
      enabled: !viewModel.model.deleted!,
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

  void favoriteMethod() {
    widget.model.favorite = !(widget.model.favorite!);
    setState(() {});
  }

  void changeNoteFunction(
      BuildContext context, ChangeNotesViewModel viewModel) {
    DateTime time = DateTime.now();
    print(
        "${time.hour} : ${time.minute} - ${time.day}:${time.month}:${time.year}");
    viewModel.changeNotes(
      context,
      NoteModel(
        id: widget.model.id,
        title: viewModel.titleController.text,
        subTitle: viewModel.noteController.text,
        date:
            "${time.hour} : ${time.minute} - ${time.day}:${time.month}:${time.year}",
        favorite: widget.model.favorite,
        deleted: false,
      ),
    );
    if (!viewModel.model.deleted!)
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeView()));
    else
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DeletedNotesView()));
    setState(() {});
  }
}
