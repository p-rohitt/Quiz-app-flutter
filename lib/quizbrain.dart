import 'question.dart';

class QuizBrain{

  int questionNumber = 0;
  final List<Question> _questionBank = [
    Question("Mo Salah won the Puskas Award 2017", true),
    Question("Ronaldo played in Madrid for 10 years", false),
    Question("Ribery and Robben played for the same club", true),
    Question("It took Cristiano Ronaldo 27 games to score his first Champions League goal.", true),
    Question("The phrase 'park the bus' arose when Jose Mourinho was forced to park the Chelsea team bus after the bus driver fell ill.", false),
    Question("Singer in Irish boyband Westlife Nicky Byrne played for Leeds United before moving into music.", true),
    Question("Sir Alex Ferguson managed the Scotland national team", true),
    Question("Liverpool legend Kenny Dalglish is known as 'King Kenny' because he is related to the British Royal Family.", false),
    Question("Frank Lampard has scored more Premier League goals than Thierry Henry, Robbie Fowler and Michael Owen.", true),
    Question("Bayern Munich star Thomas Muller is a keen chess player and once won a Bavarian chess tournament.", false),
    Question("Former Brazil and Barcelona star Ronaldinho spent time in prison after being found to have used a fake passport.", true),
    Question("David Beckham took ballet lessons during his time at Manchester United in order to improve his agility.", false),
    Question("Brazil icon Pele once starred in a Hollywood movie alongside Michael Caine and Sylvester Stallone.", true),
  ];

  void nextQuestion(){
    if(questionNumber < _questionBank.length-1){
      questionNumber++;
    }
    else print("Out of bounds");
  }

  String getQuestionText(){
    return _questionBank[questionNumber].questionText;
  }

  bool getCorrectAnswer(){
    return _questionBank[questionNumber].questionAnswer;
  }

  int questionBankLength(){
    return _questionBank.length;
  }




}