part of 'quizz_bloc_bloc.dart';

@immutable
sealed class QuizzBlocEvent {}

class LoadData extends QuizzBlocEvent {}

class AnswerOpt extends QuizzBlocEvent {}

class WrongAnswerOpt extends QuizzBlocEvent {
  BuildContext context;
  WrongAnswerOpt({required this.context});
}
