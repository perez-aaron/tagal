import 'package:flutter/material.dart';
import 'Slambook.dart';
import 'friendsummary.dart';
import 'Friends.dart';

void main() {
  runApp(NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});
  static List<SumData> sumdata = [];//list for summary data

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.purple, iconTheme: IconThemeData(color: Colors.white)), scaffoldBackgroundColor: const Color.fromARGB(255, 34, 32, 32), textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white))),
    title: "Week 5: Menu, Routes, and Navigation",
    home: Friends(summarylist: sumdata),
    initialRoute: "/",
    

    onGenerateRoute: (settings) {
      if (settings.name == "/") {
        final args = settings.arguments as List<SumData>;
        return MaterialPageRoute(builder: (context) => Friends(summarylist: args));
      }

      if (settings.name == "/second") {
        return MaterialPageRoute(builder: (context) => Slambook());
      }

      return null;
    },
    );
  }
}