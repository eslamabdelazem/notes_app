import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';
import 'package:notes/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure){
            debugPrint("failed ${state.errorMessage}");
          }
          else if(state is AddNoteSuccess){
            Navigator.pop(context);
          }
      
        },
        builder: (context, state) {
          return AbsorbPointer(
          absorbing: state is AddNoteLoading?true:false,
          child:Padding(
            padding:EdgeInsets.only(top:16,right:16,bottom:MediaQuery.of(context).viewInsets.bottom),
            child:const SingleChildScrollView(child:  AddNoteFormState()),
          ));
        },
      ),
    );
  }
}
