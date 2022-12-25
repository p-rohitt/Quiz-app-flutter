import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  bool isFinished(int questionNumber) {
    if (questionNumber >= quizBrain.questionBankLength() - 1) {
      return true;
    } else
      return false;
  }

  void checkAnswer(bool userPressedAnswer) {
    setState(() {
      bool correctAns = quizBrain.getCorrectAnswer();

      if (correctAns == userPressedAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.dangerous,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                "True",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (isFinished(quizBrain.questionNumber)) {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Thank You",
                      desc: "This is the end of the quiz",
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            setState(() {
                              quizBrain.questionNumber = 0;
                              scoreKeeper.clear();
                              Navigator.pop(context);
                            });
                          },
                          width: 120,
                          child: const Text(
                            "Start Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                  } else {
                    checkAnswer(true);
                  }
                });
              }, //user pressed true
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                "False",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {

                setState(() {
                  if (isFinished(quizBrain.questionNumber)) {
                    Alert(
                      context: context,
                      title: "Thank You",
                      desc: "This is the end of the quiz",
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            setState(() {
                              quizBrain.questionNumber = 0;
                              scoreKeeper.clear();
                              Navigator.pop(context);
                            });
                          },
                          width: 120,
                          child: const Text(
                            "Start Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                  } else {
                    checkAnswer(false);
                  }

                });

              }, //user pressed true
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
