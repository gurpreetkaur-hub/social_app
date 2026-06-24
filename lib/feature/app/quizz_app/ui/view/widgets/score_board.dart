import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final String corr_ans;
  final String out_of;
  const ScoreBoard({super.key, required this.corr_ans, required this.out_of});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$corr_ans/",
                style: TextStyle(color: Colors.black87),
              ),
              TextSpan(
                text: "$out_of",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
