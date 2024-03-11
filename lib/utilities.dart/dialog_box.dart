// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/utilities.dart/button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown[300],
      // ignore: sized_box_for_whitespace
      content: Container(
        height:120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'add new task',
              
            ),
            
          ),
          

          //buttons -> save +cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            //save button
            Button(text:"Save", onPressed:onSave),

            const SizedBox(width: 8),
            

          //cancel button

             Button(text:"Cancel", onPressed:onCancel)
          ],)

        ],)
        ),

    );
  }
  
}