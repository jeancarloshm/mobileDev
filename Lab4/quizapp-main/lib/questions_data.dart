import 'package:quizapp/questions_model.dart';

class QuizzLogic {
  //Atributos
  int questionNumber = 0;

 List<QuestionsModel> data = [
  QuestionsModel("La caja negra de un avión es negra", false),
  QuestionsModel("Waterloo tiene el mayor número de andenes de metro de Londres", true),
  QuestionsModel("M&M son las siglas de 'Mars y Moordale'", false),
  QuestionsModel("El unicornio es el animal nacional de Escocia", true),
  QuestionsModel("Hay dos partes del cuerpo que no pueden curarse a sí mismas", false),
  QuestionsModel("El rugido de un león puede oírse hasta a ocho kilómetros de distancia", true),
  QuestionsModel("Hay cinco grupos sanguíneos diferentes", false),
  QuestionsModel("La única letra que no está en la tabla periódica es la letra J", true),
  QuestionsModel("Un pulpo tiene tres corazones", true),
  QuestionsModel("Los plátanos son curvos porque crecen hacia el sol", true),
 ];
  


  //Metodos Getters para leer los atributos
  String get getQuestionText {
    return data[questionNumber].question;
  }

  bool get getQuestionAnswer {
    return data[questionNumber].answer;
  }

  int get getQuestionCount {
    return questionNumber;
  }

//Metodo para incrementar las preguntas
  void nextQuestion() {
    if (questionNumber < data.length - 1) {
      questionNumber++;
    }
  }
}
