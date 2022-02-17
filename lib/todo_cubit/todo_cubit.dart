

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_frominternet/screens/archieve_tasks.dart';
import 'package:todo_app_frominternet/screens/done_tasks.dart';
import 'package:todo_app_frominternet/screens/new_task.dart';
import 'package:todo_app_frominternet/todo_cubit/tod-_states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_frominternet/models/model_task.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

class ToDoCubit extends Cubit<ToDOStates>{
  ToDoCubit():super(InitialState());


  static ToDoCubit get(context)=>BlocProvider.of(context);


  //variables
  Database? mydb ;
  TextEditingController tasknamec = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController timec = TextEditingController();
  var formkey = GlobalKey<FormState>();
  List donetasks =[];
  List archievetasks = [];
  List newtasks = [];
  var  kThemeColor = Color(0xff041955);
  var kThemeColorLight = Color(0xff171717);


  List<Widget> screens = [NewTask(),DoneTasks(),ArchieveTasks()];
  int index = 0;





//functions

  CreatDB () async
  {

    mydb = await openDatabase("ToDo", version: 1,

        onCreate: (databasse,index)
        {
          databasse.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY , taskname TEXT , time TEXT , date TEXT , status TEXT)").then((value) {

            print("data base created suceesfuly");

          });

        },
        onOpen: (database){

          print("data base is opened");

        }

    );
emit(OpeningDataBase());
  }


  InsertIntoDB(String taskname , String date , String time) async
  {
    await    mydb!.rawInsert("INSERT INTO tasks (taskname,date,time,status) VALUES ('${taskname}', '${date}' , '${time}','new')").then((value) {

      print("data inserted suceesfuly in record ${value}");
      ReadFromDB();


    });
emit(InsertDataBase());
  }


  ReadFromDB() async
  {
    newtasks = [];
    donetasks = [];
    archievetasks = [];

    await  mydb!.rawQuery("SELECT * FROM tasks").then((value) {


      for(int i = 0; i< value.length ; i++)
      {
        if(value[i]['status']=='new')
        {
          Map m = value[i] ;
          newtasks.add(ModelTask.frommap(m));

        }
        else if(value[i]['status']=='done')
        {
          Map m = value[i] ;
          donetasks.add(ModelTask.frommap(m));

        }

        else
        {
          Map m = value[i] ;
          archievetasks.add(ModelTask.frommap(m));

        }


      }


    });

emit(ReadDataBase());
  }


  RemovDb(int id)
  {

    mydb!.rawDelete('DELETE FROM tasks WHERE id = $id');

    ReadFromDB();
    emit(DeleteDataBase());

  }

  ArchieveDb(int id)
  {
    mydb!.rawUpdate('UPDATE tasks SET status = "archieve" WHERE id = ${id}');
    ReadFromDB();
    emit(UpdateDataBase());
  }

  DoneDb(int id)
  {
    mydb!.rawUpdate('UPDATE tasks SET status = "done" WHERE id = ${id}');
    ReadFromDB();
    emit(UpdateDataBase());
  }



void Navigate(int value)
{

  index = value;
  emit(BottomNavigationBarChanged());

}




}