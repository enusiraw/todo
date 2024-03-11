// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:todo/utilities.dart/dialog_box.dart';
import 'package:todo/utilities.dart/todo_title.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  //referncet the hive box
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
//if the first time oprning the app , then create some defaukt value
if(_mybox.get("TODOLIST") == null){
  db.createInitialData();
}else{
  //there already exists fdata
  db.loadData();
}

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();


void checkBoxChanged(bool? value, int index){
  setState(() {
    db.toDoList[index][1] = !db.toDoList[index][1];
  });
  db.updateData();

}

void saveNewTask(){
  setState(() {
    db.toDoList.add([_controller.text, false]);
    _controller.clear();
    
  });
  Navigator.of(context).pop();
  db.updateData();
}

void createNewTask(){
  showDialog(
    context: context, 
    builder: (context) {  
      return DialogBox(
         controller: _controller,
         onSave: saveNewTask,
         onCancel: () => Navigator.of(context).pop,
      );

    });
}
void deleteTask(index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title : Text("To Do"),
        elevation: 0,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
         child: Icon(Icons.add)
          
      ),
      body: ListView.builder(
       
         itemCount: db.toDoList.length,
         itemBuilder: (context, index){
          return ToDoTitle(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
         },
        
      )
    );
  }
}