import 'package:flutter/material.dart';

class toDoCard extends StatelessWidget {
  var kColumnLength = 38;
  static const double kBoxsize = 60;
  static const Color dailyActivitiesColor = Color(0xFF857AB6);
  static const Color dailyActivitiesColorHilighted = Color(0xFFAA9FE6);
  static const Color lectureColor = Color(0xFFCCCE70);
  static const Color lectureColorHilighted = Color(0xFFFBFF42);
  static const Color workOutCOlor = Color(0xFF4B5396);
  static const Color workOutCOlorHilighted = Color(0xFF5A6BFF);
  static const Color studyColor = Color(0xFFEA9A81);
  static const Color studyColorHilighted = Color(0xFFFB5825);
  String name;
  double startTime;
  double duration;
  Color widgetColor;

  toDoCard({
    super.key,
    required this.startTime,
    required this.duration,
    required this.widgetColor,
    required this.name,
  });

  Color getHighlightedColor() {
    switch (widgetColor) {
      case dailyActivitiesColor:
        return dailyActivitiesColorHilighted;
      case lectureColor:
        return lectureColorHilighted;
      case workOutCOlor:
        return workOutCOlorHilighted;
      case studyColor:
        return studyColorHilighted;
      default:
        return widgetColor.withOpacity(0.7);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color highlightedColor = getHighlightedColor();

    return Positioned(
      top: (startTime - 6) * kBoxsize,
      height: kBoxsize * duration,
      left: 30,
      width: 318,
      child: Row(children: [
        Container(
          width: 13,
          decoration: BoxDecoration(
            color: highlightedColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: widgetColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
