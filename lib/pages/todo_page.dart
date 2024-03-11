// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget{
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();

}

//

class _TodoPageState extends State<TodoPage>{
  //texdt editor controller getd access what the user typed
  TextEditingController mycontroller= TextEditingController();

  String greetingMessage = "";

//greet user
void greetuser(){
  String userName = mycontroller.text;
  setState(() {
     greetingMessage = "hello, $userName";
     print(greetingMessage);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            //textfield
        TextField(
          controller:mycontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "type your name",
            ),
        ),
        ElevatedButton(
          onPressed: greetuser, 
          child: Text("Tap")
          )
       ]
      ),
      ),
    ),
    );
  }
}