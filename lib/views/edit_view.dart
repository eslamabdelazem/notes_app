import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class EditView extends StatefulWidget {
  const EditView({
    super.key,
    required this.noteModel,
    required this.index,
  });
  final NoteModel noteModel;
  final int index;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: "Edit Note",
                icon: const Icon(Icons.check),
                onTap: () async {
                  var box = await Hive.openBox<NoteModel>(notesBox);
                  var myObject = box.get(widget.index);
                  if (myObject != null) {
                    myObject.title = title ?? widget.noteModel.title;
                    myObject.subTitle = subTitle ?? widget.noteModel.subTitle;
                    await box.put(widget.index, myObject);
                  }
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: 'Title',
                  onChanged: (value) {
                    title = value;
                  }),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: "Content",
                maxLines: 8,
                onChanged: (value) {
                  subTitle = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
