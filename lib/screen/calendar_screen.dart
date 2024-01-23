import 'dart:ffi';

import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/screens/home_screen.dart';
import 'package:calendar_scheduler/screens/wakeupmode.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: CARD_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate,
            ),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(children: [
          MainCalendar(
            selectedDate: selectedDate,
            onDaySelected: onDaySelected,
          ),
          const SizedBox(
            height: 8,
          ),
          StreamBuilder<List<Schedule>>(
            stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
            builder: (context, snapshot) {
              return TodayBanner(
                  selectedDate: selectedDate,
                  count: snapshot.data?.length ?? 0);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          // TodayBanner(
          //   selectedDate: selectedDate,
          //   count: 0,
          // ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final schedule = snapshot.data![index];
                    return Dismissible(
                      key: ObjectKey(schedule.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        GetIt.I<LocalDatabase>().removeSchedule(schedule.id);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                        child: ScheduleCard(
                            startTime: schedule.startTIme,
                            endTime: schedule.endTime,
                            content: schedule.content),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
