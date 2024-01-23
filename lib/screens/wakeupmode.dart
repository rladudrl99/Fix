import 'package:flutter/material.dart';

class wakeUpMode extends StatefulWidget {
  const wakeUpMode({super.key});

  @override
  _wakeUpModeState createState() => _wakeUpModeState();
}

class _wakeUpModeState extends State<wakeUpMode> {
  List<String> activities = ['물 한잔 마시기', '침구 정리하기', '스트레칭 하기', '씻기'];
  List<bool> selectedCards = [false, false, false, false];
  bool isAllSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),
      appBar: AppBar(
        title: const Text(
          '기상 시간이에요!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF262626),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spacee,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < activities.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCards[i] = !selectedCards[i];
                  isAllSelected = selectedCards.every((element) => element);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Card(
                  color: selectedCards[i]
                      ? const Color.fromARGB(255, 77, 77, 77)
                      : const Color(0xFF262626),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.circle_rounded,
                            size: 80,
                            color: Color(0xFF857AB6),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            activities[i],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: selectedCards[i]
                                  ? Colors.white
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
            // style: const ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll(
            //   Color(0xFF857AB6),
            // )),
            onPressed: isAllSelected
                ? () {
                    // 기상 완료 동작 추가
                    Navigator.pop(context); // 현재 페이지 닫기
                  }
                : null,
            child: const Text(
              '기상 완료!',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
