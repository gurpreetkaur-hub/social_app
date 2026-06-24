import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_app/feature/app/quizz_app/data/quiz_data.dart';
import 'package:social_app/feature/app/quizz_app/domain/quiz_modal.dart';
part 'quizz_bloc_event.dart';
part 'quizz_bloc_state.dart';

class QuizzBlocBloc extends Bloc<QuizzBlocEvent, QuizzBlocState> {
  List<QuizModal> quizList = [];
  QuizzBlocBloc() : super(QuizzBlocInitial()) {
    _events();
  }

  void _events() {
    on<QuizzBlocEvent>((event, emit) {});

    on<LoadData>((event, emit) {
      print("step 11");
      emit(LoadingDataState());
      print("step 12");
      try {
        quizList = data.map<QuizModal>((e) {
          return QuizModal.fromMap(e);
        }).toList();
        print("step 13 ${quizList.length}");
        emit(LoadedData(quizList: quizList));
        print("step 14 ${quizList.length}");
      } catch (e) {
        print("step 15 $e");
        emit(LoadDataError());
      }
    });

    on<AnswerOpt>((event, emit) {
      int marks = 0;
      emit(LoadedData(marks: marks));
    });

    on<WrongAnswerOpt>((event, emit) {
      ScaffoldMessenger.of(
        event.context,
      ).showSnackBar(SnackBar(content: Text("wrong answer !!")));
    });
  }
}
