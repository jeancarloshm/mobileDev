import 'package:flutter/material.dart';
import 'package:quizapp/questions_data.dart';


//Crear un objeto de QuizBrain
QuizzLogic quiz = QuizzLogic();

void main() => runApp(const Quizz());

class Quizz extends StatelessWidget {
  const Quizz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizView(),
          ),
        ),
      ),
    );
  }
}

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizView> {
  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }

  List<Icon> scoreKeeper = [];
  int correct = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quiz.getQuestionAnswer;
    setState(() {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,

            ),
          );
          correct++;
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
    });
  }




@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)
              ),
              child: const Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                if(quiz.getQuestionCount == 9)
                {
                  checkAnswer(true);
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text('Acertaste $correct de 10'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => runApp(const Quizz()),
                          child: const Text('Reiniciar'),
                        ),
                      ],
                    ),
                  );
                }
                else
                {
                  checkAnswer(true);
                }

                setState(() {
                  quiz.nextQuestion();
                });

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)
              ),
              child: const Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                if(quiz.getQuestionCount == 9)
                {
                  checkAnswer(false);
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text('Acertaste $correct de 10'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => restartApp(),
                          child: const Text('Repetir Quizz'),
                        ),
                      ],
                    ),
                  );
                }
                else
                {
                  checkAnswer(false);
                }
                setState(() {
                  quiz.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
