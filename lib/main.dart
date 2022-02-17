


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_frominternet/screens/home_layout.dart';
import 'package:todo_app_frominternet/screens/home_page.dart';
import 'package:todo_app_frominternet/todo_cubit/todo_cubit.dart';

import 'constants.dart';
void main () {


  runApp(BlocProvider(
    create:(context)=> ToDoCubit()..CreatDB(),

    child: MaterialApp(


      debugShowCheckedModeBanner: false,
      home: HomePAge(),

    ),
  ));

}