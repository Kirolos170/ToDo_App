import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_frominternet/screens/archieve_tasks.dart';
import 'package:todo_app_frominternet/screens/done_tasks.dart';
import 'package:todo_app_frominternet/screens/home_layout.dart';
import 'package:todo_app_frominternet/screens/new_task.dart';
import 'package:todo_app_frominternet/todo_cubit/tod-_states.dart';
import 'package:todo_app_frominternet/todo_cubit/todo_cubit.dart';
import 'package:bloc/bloc.dart';
class HomePAge extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ToDoCubit,ToDOStates>(
      listener: (context,state){},
      builder: (context,state) {
        ToDoCubit cubit =ToDoCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "TO Do",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            backgroundColor: Colors.black,
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeLayout()));
          }, child: Icon(Icons.edit, color: Colors.amber.shade700,),),

          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            backgroundColor: Color(0x95171717),
            selectedItemColor: Colors.amber[700],
            onTap: (value) {
cubit.Navigate(value);

            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline), label: "Done"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined), label: "Archieve"),
            ],
            currentIndex: cubit.index,
          ),

          body: cubit.screens[cubit.index],

        );
      },
    );
  }
}
