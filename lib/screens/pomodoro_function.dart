import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pomodoro extends StatefulWidget {
  const pomodoro({super.key});

  @override
  State<pomodoro> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<pomodoro> {
  static const twentyFiveMinuites = 1500;
  int totalSecond = twentyFiveMinuites;
  bool isRunning = false;
  late Timer timer;
  int totalPomodoros = 0;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    // return duration.toString().split('.').first.substring(2, 7);
    return duration.toString().substring(2, 7);
  }

  void onTick(Timer timer) {
    if (totalSecond == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSecond = twentyFiveMinuites;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSecond = totalSecond - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSecond = 1500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: const Color(0xFF262626),
        shadowColor: Colors.black.withOpacity(0),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSecond),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                    isRunning ? Icons.pause : Icons.play_arrow_rounded,
                    color: const Color(0xFFFB5825),
                  ),
                ),
                IconButton(
                  iconSize: 80,
                  color: Theme.of(context).cardColor,
                  icon: const Icon(
                    Icons.restart_alt_outlined,
                    size: 50,
                  ),
                  onPressed: onRestartPressed,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xFF373737),
                    // color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'total',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            // color: Theme.of(context)
                            //     .textTheme
                            //     .displayLarge!
                            //     .color,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '$totalPomodoros',
                        style: const TextStyle(
                            fontSize: 58,
                            color: Colors.white,
                            // color: Theme.of(context)
                            //     .textTheme
                            //     .displayLarge!
                            //     .color,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
