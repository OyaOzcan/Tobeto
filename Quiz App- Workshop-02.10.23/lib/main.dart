import 'dart:math';

import 'package:flutter/material.dart';
import 'package:introapp/models/quiz_question.dart';
import 'package:introapp/data/question.dart';


void main() {
  runApp(const MaterialApp(home: StartScreen()));
}


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/quiz-logo.png", width: 250),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class FinishScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  const FinishScreen({Key? key, required this.correctAnswers, required this.wrongAnswers}) : super(key: key);

    final int totalQuestions = 6;
 int calculateScore() {
    return ((correctAnswers / totalQuestions) * 100).toInt();
  }


  @override
  Widget build(BuildContext context) {
    int score=calculateScore();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Puan: $score', style:TextStyle(fontSize:50, color:Colors.white)),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, color: Colors.white),
                  Text('Doğru cevap: $correctAnswers', style:TextStyle(fontSize: 30, color:Colors.white)),
                  ],
                ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.close, color: Colors.white),
                   Text('Yanlış cevap: $wrongAnswers',style:TextStyle(fontSize: 30, color: Colors.white)),
                ],
                ),

          ],
        ),
      ),
    );
  }
}

bool checkAnswer(String selectedAnswer, String correctAnswer) {
  return selectedAnswer == correctAnswer;
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int i = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  
  void changeAndCheckQuestion(String selectedAnswer) {
    
    if(checkAnswer(selectedAnswer, questions[i].correctAnswer))
       correctAnswers++;
   else 
    wrongAnswers++;

    if (i < questions.length - 1) {
      setState(() {
       i++;
      });
    }
    else {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FinishScreen(
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
      ),
    ),
  );
}
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[i].question),
            ...questions[i].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  changeAndCheckQuestion(answer);
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}