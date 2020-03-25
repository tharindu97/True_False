import 'package:flutter/material.dart';
import 'package:true_false/views/quiez_play.dart';

import 'home.dart';
class Result extends StatefulWidget {

int score, totalQuestion, correct, incorrect, notattempted;
  Result({
    this.score,
    this.totalQuestion,
    this.correct,
    this.incorrect,
    this.notattempted
  });
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  String greeting = "";
  @override
  void initState() {

    super.initState();

    var percentage = (widget.score/(widget.totalQuestion*20))*100;
    if(percentage >= 90){
      greeting = 'Outstanding';
    }
    else if(percentage > 80 && percentage <90){
      greeting = 'Good Work';
    }
    else if(percentage > 70 && percentage < 80){
      greeting = 'Good Effort';
    }else if(percentage < 70){
      greeting = 'Needs Improvement';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('$greeting',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.w500
            ),
            ),
            SizedBox(height: 14,),
            Text('You scored ${widget.score} out of ${widget.totalQuestion*20}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 8,),
            Text('${widget.correct} Correct, ${widget.incorrect} Incorrect & NotAttemped ${widget.notattempted} out of ${widget.totalQuestion}'),
            SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text('Replay Quiz Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.blue
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text('Go To Home',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue
                ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blue, width: 2)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}