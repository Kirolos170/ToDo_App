import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_frominternet/models/model_task.dart';

import 'package:todo_app_frominternet/todo_cubit/tod-_states.dart';
import 'package:todo_app_frominternet/todo_cubit/todo_cubit.dart';
import 'package:bloc/bloc.dart';
class TaskView extends StatelessWidget {
  TaskView({required this.model});

  ModelTask model;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDOStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ToDoCubit cubit = ToDoCubit.get(context);

        return Dismissible(
          key: Key(model.id.toString()),
          onDismissed: (dirction) {
            if (dirction == DismissDirection.startToEnd) {
              cubit.RemovDb(model.id!);
            }
            else {
              cubit.ArchieveDb(model.id!);
            }
          },

          background: Container(

            color: Colors.red,
            child: Padding(padding: EdgeInsets.all(8),

              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.white,),
                  Text("Move to trush", style: TextStyle(color: Colors.white),)
                ],
              ),

            ),

          ),
          secondaryBackground: Container(

            color: Colors.blue,
            child: Padding(padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Icon(Icons.archive, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text(
                    "move to arvhieve", style: TextStyle(color: Colors.white),)


                ],


              ),


            ),


          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  SizedBox(width: 20,),
                  Text("${model.taskdate}",
                    style: TextStyle(color: Colors.red, fontSize: 20),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("${model.tasktitle}", style: TextStyle(
                            color: Colors.white, fontSize: 15),),
                      ),
                      SizedBox(width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text("${model.tasktime}", style: TextStyle(
                            color: Colors.white, fontSize: 15),),
                      ),
                      IconButton(icon: Icon(Icons.done),
                        color: Colors.red,
                        onPressed: () {
                          cubit.DoneDb(model.id!);
                        },
                        iconSize: 30,)


                    ],

                  )


                ],

              ),

            ),
          ),
        );
      },
    );
  }
}