// ignore_for_file: no_logic_in_create_state, unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class counterPage extends StatefulWidget{
  const counterPage({super.key});

  @override
  State<StatefulWidget> createState() => _CounterPageState();

}

class _CounterPageState extends State<counterPage> {
  int _counter = 0;

  //method

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you pushed the button too many times"),
            Text(_counter.toString(),
            style: TextStyle(fontSize: 40)
            ),

            ElevatedButton(
              onPressed: _incrementCounter, 
              child: Text("incremented"))
          ],
        )
      )
    );
  }
  
}