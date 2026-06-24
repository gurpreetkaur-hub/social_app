import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/app/quizz_app/domain/quiz_modal.dart';
import 'package:social_app/feature/app/quizz_app/ui/bloc/quizz_bloc_bloc.dart';
import 'package:social_app/feature/app/quizz_app/ui/view/widgets/btn.dart';
import 'package:social_app/feature/app/quizz_app/ui/view/widgets/quesion_view.dart';
import 'package:social_app/feature/app/quizz_app/ui/view/widgets/score_board.dart';

class QuizzView extends StatelessWidget {
  // QuizzBlocBloc? quiz_bloc;
  final PageController pageCntrller = PageController();
  QuizzView({super.key});

  @override
  Widget build(BuildContext context) {
    // quiz_bloc = BlocProvider.of<QuizzBlocBloc>(context) ;
    return BlocBuilder<QuizzBlocBloc, QuizzBlocState>(
      builder: (context, state) {
        if (state is LoadingDataState) {
          return Scaffold(body: CircularProgressIndicator());
        } else if (state is LoadDataError) {
          return Scaffold(body: Center(child: Text('Error loading quiz')));
        } else if (state is LoadedData) {
          List<QuizModal> quizDataList = state.quizList ?? [];
          print("quizDataList ${quizDataList.length}");
          return Scaffold(
            appBar: AppBar(title: Text("Quizz App")),
            body: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageCntrller,
              itemCount: quizDataList.length,

              itemBuilder: (context, indx) {
                print("quizquiz0-${quizDataList.length}");
                final quiz = quizDataList[indx];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${indx + 1} -> ${quiz.ques}",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: quiz.options.length,
                            itemBuilder: (context, optionIndex) {
                              final option = quiz.options[optionIndex];
                              final bool isSelected =
                                  quiz.choosen_ans == option;
                              final bool isCorrect = option == quiz.answer;

                              Color color = Colors.black87;
                              if (isSelected) {
                                color = isCorrect ? Colors.green : Colors.red;
                              }

                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: InkWell(
                                  onTap: () {
                                    if (quiz.choosen_ans != null) return;

                                    // context.read<QuizzBlocBloc>().add(
                                    //   AnswerSelected(
                                    //     questionIndex: index,
                                    //     selectedOption: option,
                                    //   ),
                                    // );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: color,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),
                          ScoreBoard(
                            corr_ans: state.marks.toString(),
                            out_of: quizDataList.length.toString(),
                          ),

                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: NavButton(
                              onTap: () {
                                if (indx < quizDataList.length - 1) {
                                  pageCntrller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text('No Data quiz')));
        }
      },
    );
  }
}
