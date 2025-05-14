import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/view_note/view_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(builder: (context, state) {
      List<NoteModel> notes =
          BlocProvider.of<ViewNoteCubit>(context).loadNotes();
      List<NoteModel> reversedNotes = notes.reversed.toList();

      return (notes.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (context, index) {
                final note = reversedNotes[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: NoteItem(noteModel: note, index: note.hiveKey!),
                );
              },
              itemCount: notes.length,
              physics: BouncingScrollPhysics(),
            )
          : Center(
              child: Text(
              "There is no notes",
              style: TextStyle(fontSize: 25),
            ));
    });
  }
}
