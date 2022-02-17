import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_frominternet/db_helper.dart';
import 'package:todo_app_frominternet/todo_cubit/tod-_states.dart';
import 'package:todo_app_frominternet/todo_cubit/todo_cubit.dart';
import 'package:bloc/bloc.dart';

class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return

 BlocConsumer<ToDoCubit,ToDOStates>(
        listener: (context,state){},
        builder: (context,state) {
          ToDoCubit cubit = ToDoCubit.get(context);

          return Scaffold(
          appBar: AppBar(
          title: Text(
          "TO Do",
          style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(
            height: 50,
            ),
            Container(
            decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            )),
            width: double.infinity,
            height: 70,
            child: Center(

            child: Row(
            mainAxisSize: MainAxisSize.min,

            children: [
            SizedBox(
            width: 25,
            ),
            TextButton(
            child: Text("Cancel",
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.amber.shade700,
            )),
            onPressed: () {
            Navigator.pop(context);


            },
            ),
            SizedBox(
            width: 100,
            ),
            Text(
            "Add Task",
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.amber.shade700),
            ),

            ],
            )),
            ),


              Form(
              key: cubit.formkey,
              child: SingleChildScrollView(
                child: Column(
                children: [


                SizedBox(
                height: 20,
                ),
         TextFormField(
                controller: cubit.tasknamec,
                validator: (value) {
                if (value!.isEmpty) {
                return "title must not be empty";
                } else {
                return null;
                }
                },
                decoration: InputDecoration(
                   errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),


                prefixIcon: Icon(Icons.title),
                label: Text("New Task"),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade700),
                borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                ),
                SizedBox(height: 10),
                TextFormField(
                decoration: InputDecoration(
                   errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),

                prefixIcon: IconButton(
                icon: Icon(Icons.timer),
                onPressed: () {
                showTimePicker(
                context: context,
                initialTime: TimeOfDay.now())
                    .then((value) {
         cubit. timec.text = value!.format(context);
                });
                },
                ),
                label: Text("TaskTime"),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade700),
                borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                controller:cubit. timec,
                validator: (value) {
                if (value.toString().isEmpty) {
                return "time must not be empty";
                } else {
                return null;
                }
                },
                ),
                SizedBox(height: 10),
                TextFormField(

                decoration: InputDecoration(



                     errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),

                prefixIcon: IconButton(
                icon: Icon(Icons.date_range),

                onPressed: () {
                showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.parse('2025-10-03'))
                    .then((value) => cubit.dateC.text =
                DateFormat.yMMMd().format(value!));
                },
                ),
                label: Text("Task DeadLine"),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade700),
                borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                controller:cubit. dateC,
                validator: (value) {
                if (value!.isEmpty) {
                return "date must not be empty";
                } else {
                return null;
                }
                },
                )
                ],
                ),
              )),



            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){


            if (cubit.formkey.currentState!.validate()) {
      cubit.    InsertIntoDB( cubit.tasknamec.text,  cubit.dateC.text, cubit. timec.text);
      cubit. tasknamec.text = "";
      cubit.dateC.text = "";
      cubit.timec.text = '';
            Navigator.pop(context);
            }
            }, child: Container(
            width: 100,
            height: 20,
            child: Center(child: Text("Save" )),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(

            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),

            )

            ),

            )
            )
            ]
            ,
            ),
          )
          ,

          );
        },
      );


  }


}
