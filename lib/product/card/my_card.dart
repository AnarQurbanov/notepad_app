import 'package:flutter/material.dart';
import '../../core/extension/context_extension.dart';
import '../../view/change_notes_page/view/change_notes_view.dart';
import '../../view/model/note_model.dart';

class MyCard extends StatelessWidget {
  final NoteModel model;

  const MyCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChangeNotesView(model))),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 0.5,
              ),
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    model.title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.textTheme.headlineSmall!.fontSize),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    model.subTitle!.length >= 50
                        ? model.subTitle!.substring(0, 50) + "..."
                        : model.subTitle!,
                    style: TextStyle(
                        fontSize: context.textTheme.subtitle1!.fontSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
