import 'package:exer5/main.dart';
import 'package:flutter/material.dart';
import '/drawer.dart';
import 'mainex4.dart';

class Slambook extends StatefulWidget {//slambook class for easier linking to drawer
  const Slambook({super.key});

  @override
  State<Slambook> createState() => _SlambookState();
}

class _SlambookState extends State<Slambook> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(summarylist: NavApp.sumdata),
      appBar: AppBar(
        title: Text(
          "Slambook",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
            MainForm(),
        ),
      ),
    );
  }
}
