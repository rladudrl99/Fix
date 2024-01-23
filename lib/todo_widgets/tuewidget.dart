import 'package:flutter/material.dart';

class tueWidget extends StatelessWidget {
  var kColumnLength = 38;
  static const double kBoxsize = 60;
  static const Color dailyActivitiesColor = Color(0xFF857AB6);
  static const lectureColor = Color(0xFFCCCE70);
  static const Color workOutCOlor = Color(0xFF4B5396);
  static const Color studyColor = Color(0xFFEA9A81);
  tueWidget({super.key});

  static List<Widget> widgets = [
    Positioned(
      top: kBoxsize * 0,
      left: 30,
      height: kBoxsize * 1,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFAA9FE6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF857AB6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '기상',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 3,
      left: 30,
      height: kBoxsize * 2.5,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFFBFF42),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: lectureColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '운영체제 수업',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 9,
      left: 30,
      height: kBoxsize * 1.25,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFFBFF42),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: lectureColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '인문학글쓰기 수업',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 6,
      left: 30,
      height: kBoxsize * 1,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFAA9FE6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF857AB6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '점심식사',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 1.25,
      left: 30,
      height: kBoxsize * 1,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFF5A6BFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: workOutCOlor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '운동',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 11,
      left: 30,
      height: kBoxsize * 1,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFAA9FE6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF857AB6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '저녁식사',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      // top: kFirstColumnHeight + kBoxsize / 2,
      top: kBoxsize * 13,
      left: 30,
      // height: kBoxsize + kBoxsize * 0.5,
      height: kBoxsize * 2,
      width: 318,

      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFFB5825),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEA9A81),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 13),
                child: Text(
                  '자기개발',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ),
    Positioned(
      top: kBoxsize * 17,
      left: 30,
      height: kBoxsize * 2,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: const BoxDecoration(
              color: Color(0xFFAA9FE6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF857AB6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '수면',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [...widgets],
    );
  }
}
