import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  Function() onTap;
  NavButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        child: Center(
          child: Text("Next Ques->", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
