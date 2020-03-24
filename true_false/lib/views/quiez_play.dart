import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:true_false/data/data.dart';
import 'package:true_false/model/questionmodel.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin{
  List<QuestionModel> _questions = new List<QuestionModel>();
  int index = 0;
  int correct = 0, incorrect =0, notAttempted = 0, points =0;

  double beginAnim = 0.0;
  double endAnim = 1.0;

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    
    super.initState();
    _questions = getQuestion();

    animationController = AnimationController(
      duration: const Duration(seconds: 15), vsync: this
    );
    animation = Tween(begin: beginAnim, end: endAnim).animate(animationController);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('${index+1}/${_questions.length}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  SizedBox(width: 8,),
                  Text('Question',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Spacer(),
                  Text('$points',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('Points',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
            Text('${_questions[index].getQuestion()}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            ),
            SizedBox(height: 20,),
            LinearProgressIndicator(
              value: animation.value,
            ),
            CachedNetworkImage(imageUrl: _questions[index].getImageUrl()),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('True',
                          style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.blue
                        ),
                      )
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('False',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.red
                        ),
                      )
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}