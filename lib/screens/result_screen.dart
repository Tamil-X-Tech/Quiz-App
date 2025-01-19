import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String _getRanking(int score) {
    if (score >= 80) {
      return 'Gold';
    } else if (score >= 50) {
      return 'Silver';
    } else {
      return 'Bronze';
    }
  }

  Color _getRankingColor(String ranking) {
    if (ranking == 'Gold') {
      return Colors.yellow.shade700;
    } else if (ranking == 'Silver') {
      return Colors.grey.shade400;
    } else {
      return Colors.brown.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    String ranking = _getRanking(score);
    Color rankingColor = _getRankingColor(ranking);

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display Score and Ranking
              Text(
                'Your Score: $score',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ranking: $ranking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: rankingColor,
                ),
              ),
              SizedBox(height: 20),
              
              // Ranking Icon
              Icon(
                ranking == 'Gold' 
                  ? Icons.emoji_events 
                  : (ranking == 'Silver' ? Icons.emoji_events : Icons.emoji_flags),
                size: 60,
                color: rankingColor,
              ),
              SizedBox(height: 20),
              
              // Restart Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
