import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {

  static final List<String> _superpower = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",//list of values in dropdown
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya",
  ];

  static void reset(dropdown drop){
      drop._dropdownValue = "Makalipad";
  }

  final Function callback;
  dropdown(this.callback, {super.key});
  String _dropdownValue = _superpower.first;

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [//text for dropdown
          Text("Superpower", style: TextStyle(color: Colors.white, fontSize: 20),),
          Text("If you were to have a superpower what would you choose?", style: TextStyle(color: Colors.white, fontSize: 14),),
          DropdownButtonFormField<String>(
              dropdownColor: Colors.black,
              value: widget._dropdownValue,
              items: dropdown._superpower.map((superpower) {
                return DropdownMenuItem<String>(//returns list per item
                  child: Text(superpower, style: TextStyle(color: Colors.white),),
                  value: superpower,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  widget._dropdownValue = val!;
                });
                widget.callback(widget._dropdownValue);
              })
        ],
      ),
    );
  }
}
