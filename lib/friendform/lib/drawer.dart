import 'package:flutter/material.dart';
import 'main.dart';
import 'friendsummary.dart';

class DrawerWidget extends StatefulWidget {
  final List<SumData>? summarylist;
  const DrawerWidget({this.summarylist, super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(//list view for the two choices
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 77, 14, 96)),
            child: 
            Text("Week 5: Menu, Routes, and Navigation",
              style: TextStyle(color: Colors.white),),
          ),
          ListTile
          (
            title: const Text("Friends"),//links to friends
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/", arguments: NavApp.sumdata);//argument needed to pass
            },
          ),
          ListTile
          (
            title: const Text("Slambook"),//links to slambook
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/second");
            },
          )
        ],
      ),
    );
  }
}
