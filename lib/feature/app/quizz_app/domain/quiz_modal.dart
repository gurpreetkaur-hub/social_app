class QuizModal {
  String id;
  String ques;
  List<String> options;
  String answer;
  String? choosen_ans;

  QuizModal({
    required this.answer,
    required this.id,
    required this.options,
    required this.ques,
    this.choosen_ans,
  });

  factory QuizModal.fromMap(Map<String, dynamic> map) {
    return QuizModal(
      answer: map['correctAnswer'] ?? "",
      id: map['id'].toString() ?? "",
      options: map['options'] ?? [],
      ques: map['question'] ?? '',
    );
  }
}
