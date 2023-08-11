import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDice = 1;
  int rightDice = 1;

  void throwDice()
  {
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Dice App'),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(child: Image.asset('images/dice$leftDice.png'),
                  onPressed: (){
                    throwDice();
                  },
                ),
              ),
              Expanded(child: TextButton(
                child: Image.asset('images/dice$rightDice.png'),
                onPressed: (){
                  throwDice();
                },
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
