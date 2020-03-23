import 'package:flutter/material.dart';
import 'package:true_false/views/quiez_play.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Quiz()
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text('Start Quiz now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),
            ),
          ),
        ),
      ),
    );
  }
}