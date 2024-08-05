import 'package:flutter/material.dart';
import '../utils/number_generator_3.dart';
import '../widgets/non_clickable_number.dart';
import '../widgets/number_option_button.dart';
import 'right_answer.dart';
import 'wrong_answer.dart';
class MultiplesOfFive extends StatefulWidget {
  final int initialScore;

  MultiplesOfFive({this.initialScore = 0});

  @override
  _MultiplesOfFivePageState createState() => _MultiplesOfFivePageState();
}

class _MultiplesOfFivePageState extends State<MultiplesOfFive> {
  bool showSpanish = false;
  List<String> sequence = [];
  String correctOption = '';
  List<String> options = [];
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
    generateSequence();
  }

  void generateSequence() {
    sequence = NumberGenerator3.generateSequence(4);
    correctOption = NumberGenerator3.generateCorrectOption();
    options = NumberGenerator3.generateOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('Multiples of Five'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/p5.gif', // Ensure your image path is correct
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (String number in sequence)
                      NonClickableNumber(
                        text: showSpanish
                            ? NumberGenerator3.convertToSpanish(number)
                            : number,
                      ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Choose an Option',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ...options
                    .map((option) => NumberOptionButton(
                  text: showSpanish
                      ? NumberGenerator3.convertToSpanish(option)
                      : option,
                  onPressed: () {
                    setState(() {
                      if (option == correctOption) {
                        score += 10;
                      } else {
                        score -= 5;
                      }
                    });
                    navigate(context, option == correctOption);
                  },
                ))
                    .toList(),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSpanish = !showSpanish;
                    });
                  },
                  child: Text(showSpanish ? 'English' : 'Español',
                      style: TextStyle(fontSize: 23)),
                ),
              ],
            ),
          ),
        ]));
  }

  void navigate(BuildContext context, bool isCorrect) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => isCorrect
            ? RightAnswerPage(
            score: score,
            onNextQuestionPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MultiplesOfFive(initialScore: score)));
            })
            : WrongAnswerPage(score: score),
      ),
    );
  }
}