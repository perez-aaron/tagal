import 'package:flutter/material.dart';

class friendsum extends StatefulWidget {//class for printing friends summary
  final String _text;
  final String _text2;//initializing 
  final String _text3;
  final bool _inRelationship;
  final String _super;
  final String _motto;
  final double _happiness;
  const friendsum(this._text, this._text2, this._text3, this._inRelationship, this._happiness, this._super, this._motto, {super.key});

  @override
  State<friendsum> createState() => _friendsumState();
}

class _friendsumState extends State<friendsum> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget._text, style: const TextStyle(color: Colors.white))),
      body: Container(
      margin: const EdgeInsets.all(16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Text("Summary", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),

          const Divider(),
          const Padding(padding: EdgeInsets.all(10)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._text, style: const TextStyle(fontSize: 18,  color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Nickname ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._text2, style: const TextStyle(fontSize: 18, color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Age ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._text3, style: const TextStyle(fontSize: 18, color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("In a Relationship? ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._inRelationship ? "Yes":"No", style: const TextStyle(fontSize: 18,  color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Happiness ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._happiness.toString(), style: const TextStyle(fontSize: 18,  color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Superpower ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._super, style: const TextStyle(fontSize: 18, color: Colors.white)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Motto ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              Expanded(child: Text(widget._motto, style: const TextStyle(fontSize: 18, color: Colors.white)))
            ],
          ),
        const SizedBox(height: 100),

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white)
          ),
          child: const Text("Go back", style: TextStyle(color: Colors.white)),
         
          onPressed: (){
            Navigator.pop(context);
          },
          ),const SizedBox(height: 50)
        ],
      )
    )
    );
  }
}

class SumData{//class for making objects of the summary of each friend
  final String _text;
  final String _text2;
  final String _text3;
  final double _happiness;
  final bool _inRelationship;
  final String _super;
  final String _motto;
  SumData(this._text, this._text2, this._text3, this._inRelationship, this._happiness, this._super, this._motto);

  String get name => _text;
  String get nickname => _text2;
  String get age => _text3;
  double get happinessLevel => _happiness;
  bool get inRelationship => _inRelationship;
  String get superpower => _super;
  String get motto => _motto;
}
