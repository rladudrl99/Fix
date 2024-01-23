import 'package:calendar_scheduler/screen/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/reusable/todocard.dart';
import 'package:calendar_scheduler/screens/pomodoro_function.dart';
import 'package:calendar_scheduler/screens/wakeupmode.dart';
import 'package:calendar_scheduler/time_table_per_day/daytimetable.dart';
import 'package:calendar_scheduler/time_table_per_day/timetable.dart';
import 'package:calendar_scheduler/todo_widgets/monwidget.dart';
import 'package:calendar_scheduler/todo_widgets/tuewidget.dart';
import 'package:calendar_scheduler/todo_widgets/wenwidget.dart';
import 'package:calendar_scheduler/todo_widgets/thuwidget.dart';
import 'package:calendar_scheduler/todo_widgets/friwidget.dart';
import 'package:calendar_scheduler/todo_widgets/satwidget.dart';
import 'package:calendar_scheduler/todo_widgets/sunwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color dailyActivitiesColor = Color(0xFF857AB6);
  static const Color lectureColor = Color(0xFFCCCE70);
  static const Color workOutCOlor = Color(0xFF4B5396);
  static const Color studyColor = Color(0xFFEA9A81);

  List<String> weekDays = ['월', '화', '수', '목', '금', '토', '일'];
  static int selectedDayIndex = 0;
  Future<void> showEditPopup() async {
    String name = "";
    double startTime = 0.0;
    double duration = 1.0;
    Color widgetColor = Colors.blue; // 기본값 설정

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF262626),
          iconColor: const Color.fromARGB(255, 56, 56, 56),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          title: const Text(
            '할 일 추가',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(labelText: '이름'),
                ),
                TextField(
                  onChanged: (value) {
                    startTime = double.tryParse(value) ?? 0.0;
                  },
                  decoration: const InputDecoration(labelText: '시작 시간'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  onChanged: (value) {
                    duration = double.tryParse(value) ?? 1.0;
                  },
                  decoration: const InputDecoration(labelText: '지속 시간'),
                  keyboardType: TextInputType.number,
                ),
                DropdownButton<Color>(
                  value: dailyActivitiesColor,
                  onChanged: (Color? value) {
                    if (value != null) {
                      setState(() {
                        widgetColor = value;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: dailyActivitiesColor,
                      child: Text(
                        '일상',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: lectureColor,
                      child: Text(
                        '강의',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: workOutCOlor,
                      child: Text(
                        '운동',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: studyColor,
                      child: Text(
                        '자기개발',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                addTodoCardToSelectedDay(
                    name, startTime, duration, widgetColor);
                Navigator.pop(context);
              },
              child: const Text(
                '추가하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void addTodoCardToSelectedDay(
      String name, double startTime, double duration, Color widgetColor) {
    setState(() {
      switch (selectedDayIndex) {
        case 0:
          monWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 1:
          tueWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 2:
          wenWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 3:
          thuWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 4:
          friWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 5:
          satWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
        case 6:
          sunWidget.widgets.add(
            toDoCard(
              startTime: startTime,
              duration: duration,
              widgetColor: widgetColor,
              name: name,
            ),
          );
          break;
      }
    });
  }

  Widget buildDayBox(int index) {
    bool isSelected = index == selectedDayIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDayIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF545454) : const Color(0xFF262626),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDays[index],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              Icons.circle,
              color: isSelected ? Colors.green : const Color(0xFF9A9595),
              size: 35,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),
      body: Column(children: [
        const SizedBox(
          height: 70,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              ...List.generate(
                weekDays.length,
                (index) => buildDayBox(index),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 500,
          child: Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.small(
                backgroundColor: const Color(0xFF373737),
                onPressed: () {
                  showEditPopup();
                },
                tooltip: '수정',
                child: const Icon(
                  Icons.edit,
                ),
              ),
              const Text(
                'to do',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const Text(
                'mode',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 500,
          child: Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: dayTimetable(selectedDayIndex: selectedDayIndex),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          border: Border(
              // top: BorderSide(color: Colors.grey, width: 0.5),
              ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarScreen()));

                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const wakeUpMode()));
                default:
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), label: '캘린더'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '내정보'),
              // BottomNavigationBarItem(icon: Icon(Icons.bed), label: '기상'),
            ],
            backgroundColor: const Color(0xFF373737),
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: const Color(0xFF9c9c9c),
          ),
        ),
      ),
    );
  }
}
