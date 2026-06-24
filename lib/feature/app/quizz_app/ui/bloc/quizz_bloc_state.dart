part of 'quizz_bloc_bloc.dart';

@immutable
sealed class QuizzBlocState {}

final class QuizzBlocInitial extends QuizzBlocState {}

final class LoadingDataState extends QuizzBlocState {}

final class LoadDataError extends QuizzBlocState {}

final class LoadedData extends QuizzBlocState {
  List<QuizModal>? quizList;
  int marks;
  LoadedData({this.quizList, this.marks = 0});
}

// final class isCorrect extends QuizzBlocState {}

final class isWrongState extends QuizzBlocState {}

// final class ScoreBoardState extends QuizzBlocState {
//   int marks;
//   ScoreBoardState({required this.marks});
// }
