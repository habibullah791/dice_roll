import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[900],
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Center(
            child: Text(
              'Roll !T',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Julee',
                // fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
        body: RollTheDice(),
      ),
    ),
  );
}

class RollTheDice extends StatefulWidget {
  const RollTheDice({Key? key}) : super(key: key);

  @override
  State<RollTheDice> createState() => _RollTheDiceState();
}

class _RollTheDiceState extends State<RollTheDice> {

  int leftDice = 1;
  int rightDice = 5;
  String message = 'Roll iT To See';

  //function to change the leftDice
  void changeLeftDice(){
    setState(() {
      leftDice= Random().nextInt(6) +1;

      if (leftDice == rightDice){
        message = 'Both Are Equal .';
      }
      else{
        message = 'Roll iT To See';
      }
    });
  }

  //function to change the rightDice
  void changeRightDice(){
    setState(() {
      rightDice= Random().nextInt(6) +1;

      if (leftDice == rightDice){
        message = 'Both Are Equal .';
      }
      else{
        message = 'Roll iT To See';
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 140.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            const Text(
              'Roll It To Play',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Julee'
              ),
            ),
            Row(
            children: <Widget>[
              Expanded(
                  child: TextButton(
                    onPressed: (){
                      changeLeftDice();
                    },
                    child: Image.asset('images/dice$leftDice.png'),
                  )
              ),
              Expanded(
                  child: TextButton(
                    onPressed: (){
                      changeRightDice();
                    },
                    child: Image.asset('images/dice$rightDice.png'),
                  )
              )
            ],
          ),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Julee'
              ),
            )
    ],
        ),
      ),
    );
  }
}