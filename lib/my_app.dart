import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/view_note/view_note_cubit.dart';
import 'package:notes/main.dart';
import 'package:notes/views/notes_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      home: BlocProvider(
        create: (context) => ViewNoteCubit(),
        child: NotesView(key: notesViewKey,),
      ),
    );
  }
}
