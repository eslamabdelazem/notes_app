import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/edit_view.dart';
import 'package:notes/views/notes_view.dart';

class NoteItem extends StatelessWidget {
final NoteModel  noteModel;
final int index;
  const NoteItem({required this.noteModel,super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
        return EditView(noteModel:noteModel,index: index,);
      })),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
          noteModel.title ,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(noteModel.subTitle
               ,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(

                onPressed: () {
                  noteModel.delete();
                  (notesViewKey.currentWidget as NotesView?)?.refresh();

                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                noteModel.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}