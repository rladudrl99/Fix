import 'package:calendar_scheduler/screen/calendar_screen.dart';
import 'package:calendar_scheduler/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFF262626),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    ),
  );
}
