import 'package:flutter/material.dart';

class friWidget extends StatelessWidget {
  var kColumnLength = 38;
  static const double kBoxsize = 60;
  static const Color dailyActivitiesColor = Color(0xFF857AB6);
  static const Color lectureColor = Color(0xFFCCCE70);
  static const Color workOutCOlor = Color(0xFF4B5396);
  static const Color studyColor = Color(0xFFEA9A81);
  friWidget({super.key});

  static List<Widget> widgets = [
    Positioned(
      // top: kFirstColumnHeight + kBoxsize / 2,
      top: 0,
      left: 30,
      // height: kBoxsize + kBoxsize * 0.5,
      height: kBoxsize,
      width: 318,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF857AB6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            '기상',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [...widgets],
    );
  }
}
