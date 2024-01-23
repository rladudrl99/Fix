import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:calendar_scheduler/todo_widgets/monwidget.dart';
import 'package:calendar_scheduler/todo_widgets/tuewidget.dart';
import 'package:calendar_scheduler/todo_widgets/wenwidget.dart';
import 'package:calendar_scheduler/todo_widgets/thuwidget.dart';
import 'package:calendar_scheduler/todo_widgets/friwidget.dart';
import 'package:calendar_scheduler/todo_widgets/satwidget.dart';
import 'package:calendar_scheduler/todo_widgets/sunwidget.dart';

import 'package:calendar_scheduler/screens/home_screen.dart';

// ignore: must_be_immutable
class dayTimetable extends StatefulWidget {
  int selectedDayIndex = 0;
  dayTimetable({super.key, required this.selectedDayIndex});

  @override
  State<dayTimetable> createState() => _dayTimetableState();
}

class _dayTimetableState extends State<dayTimetable> {
  List<String> Week = ['mon', 'tue', 'wen', 'thu', 'fri', 'sat', 'sun'];

  var kColumnLength = 38;

  double kFirstColumnHeight = 20;

  double kBoxsize = 60;

  Expanded buildTimeColumn() {
    return Expanded(
      child: Stack(
        children: [
          Column(
            children: [
              // SizedBox(
              //   height: kFirstColumnHeight,
              // ),
              ...List.generate(
                kColumnLength,
                (index) {
                  if (index % 2 == 0) {
                    return const Divider(
                      color: Colors.grey,
                      height: 0,
                    );
                  }
                  return SizedBox(
                    height: kBoxsize,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '${index ~/ 2 + 6}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildDayColumn(int index) {
    return [
      const VerticalDivider(
        color: Colors.grey,
        width: 0,
      ),
      Expanded(
        flex: 4,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Text(
                    Week[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ...List.generate(
                  kColumnLength,
                  (index) {
                    if (index % 2 == 0) {
                      return const Divider(
                        color: Colors.grey,
                        height: 0,
                      );
                    }
                    return SizedBox(
                      height: kBoxsize,
                      child: Container(),
                    );
                  },
                )
              ],
            )
          ],
        ),
      )
    ];
  }

  Widget buildDayContent() {
    switch (widget.selectedDayIndex) {
      case 0:
        return monWidget();
      case 1:
        return tueWidget();
      case 2:
        return wenWidget();
      case 3:
        return thuWidget();
      case 4:
        return friWidget();
      case 5:
        return satWidget();
      case 6:
        return sunWidget();
      default:
        return Container(
          child: const Text('Error'),
        );
    }
  }

  // void addWidget(){
  //   setState(() {
  //     widgets.add(Positioned(child:
  //     ))
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
                child: Container(
                  height: (kColumnLength / 2 * kBoxsize) + 2,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      buildTimeColumn(),
                      buildDayContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
