import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:flutter/src/widgets/basic.dart' as basic;

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  const ScheduleBottomSheet({super.key, required this.selectedDate});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding:
                EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: basic.Column(
              
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작시간',
                        isTime: true,
                        onSaved: (String? val) {
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '종료시간',
                    isTime: true,
                    onSaved: (String? val) {
                      endTime = int.parse(val!);
                    },
                    validator: timeValidator,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      content = val;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSavePressed,
                    // style:
                    //     ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                    child: const Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await GetIt.I<LocalDatabase>().createSchedules(
        SchedulesCompanion(
          startTIme: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDate),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해 주세요';
    }
    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해 주세요';
    }
    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해 주세요';
    }
    return null;
  }

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '값을 입력해 주세요';
    }

    return null;
  }
}
