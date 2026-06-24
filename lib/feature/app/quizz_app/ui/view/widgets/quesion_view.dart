import 'package:flutter/material.dart';

class QuesionView extends StatelessWidget {
  final String ques;
  final List<String> options;
  final bool isCorrect;
  Function() onTap ; 
   QuesionView({
    super.key,
    required this.options,
    required this.ques,
    required this.isCorrect,
    required this.onTap 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ques, style: TextStyle(color: Colors.blue)),
        SizedBox(height: 20),
        ListView.builder(
          itemCount: options.length,
          itemBuilder: (contex, idx) {
            Text(
              options[idx],
              style: TextStyle(color: isCorrect ? Colors.green : Colors.amber),
            );
          },
        ),
      ],
    );
  }
}
