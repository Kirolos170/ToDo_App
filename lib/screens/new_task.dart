import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_frominternet/components/task_view.dart';
import 'package:todo_app_frominternet/models/model_task.dart';
import 'package:todo_app_frominternet/constants.dart';
import 'package:todo_app_frominternet/todo_cubit/tod-_states.dart';
import 'package:todo_app_frominternet/todo_cubit/todo_cubit.dart';
import 'package:bloc/bloc.dart';
class NewTask extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit,ToDOStates>(
      listener: (context,state){},
      builder: (context,state) {
        ToDoCubit cubit = ToDoCubit.get(context);

       return
        ListView.builder(itemBuilder: (context, index) {
          return TaskView(model: cubit.newtasks[index]);
        },
          itemCount:cubit. newtasks.length,
        );
      },
    );
  }
}




