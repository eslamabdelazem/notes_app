import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes/models/note_model.dart';
part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
  List<NoteModel> notes = [];
  List<NoteModel> loadNotes() {
    var box = Hive.box<NoteModel>("notes_box");
    notes = box.toMap().entries.map((e) {
      e.value.hiveKey = e.key;
      return e.value;
    }).toList();
    return notes;
  }
}
