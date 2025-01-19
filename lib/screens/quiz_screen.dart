import 'package:flutter/material.dart';
import 'dart:async';

import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isLoading = true;
  bool _isAnswerSelected = false;
  bool _isCorrectAnswer = false;
  int _timeLeft = 20;  // Reduced to 20 seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _startTimer();
  }

  // questions
  Future<void> _loadQuestions() async {
    setState(() {
      _questions = [
        Question(
          questionText: "Who is the highest run-scorer in ODI cricket?",
          options: ["Sachin Tendulkar", "Virat Kohli", "Brian Lara", "Ricky Ponting"],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "Which country hosted the 2011 Cricket World Cup?",
          options: ["India", "Australia", "South Africa", "England"],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "Who holds the record for the most wickets in Test cricket?",
          options: ["Shane Warne", "Muttiah Muralitharan", "Anil Kumble", "James Anderson"],
          correctAnswerIndex: 1,
        ),
        Question(
          questionText: "What is the name of the Indian cricket team's stadium in Ahmedabad?",
          options: ["Wankhede Stadium", "Eden Gardens", "Narendra Modi Stadium", "M Chinnaswamy Stadium"],
          correctAnswerIndex: 2,
        ),
        Question(
          questionText: "Who is known as the 'Master Blaster' in cricket?",
          options: ["Shahid Afridi", "Chris Gayle", "Sachin Tendulkar", "AB de Villiers"],
          correctAnswerIndex: 2,
        ),
        Question(
          questionText: "Which cricketer is known as the 'Captain Cool'?",
          options: ["MS Dhoni", "Virat Kohli", "Ricky Ponting", "Steve Smith"],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "Who is the fastest to 10,000 runs in ODI cricket?",
          options: ["Sachin Tendulkar", "Virat Kohli", "Brian Lara", "Chris Gayle"],
          correctAnswerIndex: 1,
        ),
        Question(
          questionText: "Which country won the 2019 Cricket World Cup?",
          options: ["England", "India", "Australia", "New Zealand"],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "Who is the only cricketer to have scored 100 international centuries?",
          options: ["Shahid Afridi", "Virat Kohli", "Sachin Tendulkar", "Jacques Kallis"],
          correctAnswerIndex: 2,
        ),
        Question(
          questionText: "Which cricketer is known for the 'Dilscoop' shot?",
          options: ["MS Dhoni", "Shahid Afridi", "AB de Villiers", "Chris Gayle"],
          correctAnswerIndex: 2,
        ),
      ];
      _isLoading = false;
    });
  }

  void _answerQuestion(int selectedIndex) {
    setState(() {
      _isAnswerSelected = true;
      _isCorrectAnswer = _questions[_currentQuestionIndex].correctAnswerIndex == selectedIndex;
      if (_isCorrectAnswer) {
        _score += 10;
      }

      _showAnswerFeedback();
      _stopTimer();

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isAnswerSelected = false;
          if (_currentQuestionIndex < _questions.length - 1) {
            _currentQuestionIndex++;
            _startTimer();
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ResultScreen(score: _score)),
            );
          }
        });
      });
    });
  }

  void _startTimer() {
    _timeLeft = 20;  // Resetting the time for each question
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0 && !_isAnswerSelected) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        if (!_isAnswerSelected) {
          _answerQuestion(-1); // if run time is finished to answer auto
        }
      }
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _timeLeft = 0;
    });
  }
//dialog box for if answer correct or wrong
  void _showAnswerFeedback() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: _isCorrectAnswer ? Colors.green.shade100 : Colors.red.shade100,
          title: Text(
            _isCorrectAnswer ? "Correct!" : "Wrong!",
            style: TextStyle(
              color: _isCorrectAnswer ? Colors.green : Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            _isCorrectAnswer
                ? "Great job!"
                : "Oops! The correct answer is: ${_questions[_currentQuestionIndex].options[_questions[_currentQuestionIndex].correctAnswerIndex]}",
            style: TextStyle(fontSize: 18),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: Text('No questions available.')),
      );
    }

    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                
              ],
            ),
            SizedBox(height: 10),

            // Progress bar 
            LinearProgressIndicator(
              value: (_timeLeft / 20),  // Adjusted for 20 seconds
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                _timeLeft > 5 ? Colors.green : Colors.red,
              ),
              minHeight: 8,
            ),
            SizedBox(height: 20),

            // Questions style
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 75),
                child: Text(
                  question.questionText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Options style
            ...question.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: _isAnswerSelected
                        ? (idx == question.correctAnswerIndex
                            ? Colors.green
                            : Colors.red)
                        : Colors.blue.shade500,
                    foregroundColor: Colors.white,
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  onPressed: _isAnswerSelected ? null : () => _answerQuestion(idx),
                  child: Center(
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
            Spacer(),

            // Score Display
            Center(
              child: Text(
                'Score: $_score',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
