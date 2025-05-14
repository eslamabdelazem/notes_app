import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';
import 'package:notes/cubits/view_note/view_note_cubit.dart';
import 'package:notes/main.dart';
import 'package:notes/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
  void refresh() {
    final state = notesViewKey.currentState as _NotesViewState?;
    state?._refreshData();
  }
}


class _NotesViewState extends State<NotesView> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this , ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
  @override
  void didPopNext() {
    _refreshData();
  }
  void _refreshData() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewNoteCubit(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => AddNoteCubit(),
                        child: AddNoteBottomSheet(),
                      );
                    });
              },
              backgroundColor: Colors.blue,
              child:
              Icon(Icons.add)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppBar(
                    title: "Notes", icon: Icon(Icons.search), onTap: () {},),
                  Expanded(
                      child: NotesListView())
                ],
              ),
            ),
          )
      ),
    );
  }
}


