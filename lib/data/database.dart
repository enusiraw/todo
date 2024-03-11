// ignore_for_file: unused_field

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList = [];
  // referce the box
  final _mybox = Hive.box('mybox');

  //create intial fdata
  void createInitialData(){
    toDoList = [
      ["make tutorial",false],
      ["workout",false],
    ];
  }
  //load the from the database
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }

  //updata the database
  void updateData(){
    _mybox.put("TODOLIST",toDoList);
    
  }
}