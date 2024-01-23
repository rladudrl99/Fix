import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  const MainCalendar(
      {super.key, required this.onDaySelected, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      // locale: 'ko_kr',
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: LIGHT_GREY_COLOR,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            // color: LIGHT_GREY_COLOR,
            color: BACKGROUND_COLOR,
          ),
          weekendDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            // color: LIGHT_GREY_COLOR,
            color: BACKGROUND_COLOR,
          ),
          selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: CARD_COLOR,
              width: 1,
            ),
          ),
          defaultTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: LIGHT_GREY_COLOR,
          ),
          weekendTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: LIGHT_GREY_COLOR,
          ),
          selectedTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: CARD_COLOR,
          ),
          outsideTextStyle: TextStyle(
            color: DARK_GREY_COLOR,
          )),
    );
  }
}
