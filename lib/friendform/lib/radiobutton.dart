import 'package:flutter/material.dart';

class radiobutton extends StatefulWidget {
  radiobutton(this.callback,{super.key});
  final Function callback;
  String choice = "Haters gonna hate";
  static void reset(radiobutton brad){
      brad.choice = "Haters gonna hate";
  }

  @override
  State<radiobutton> createState() => _radiobuttonState();
}


class _radiobuttonState extends State<radiobutton> {
  static final Map<String, bool> _motto = {
"Haters gonna hate": true,
"Bakers gonna Bake": false,
"If cannot be, borrow one from three": false,
"Less is more, more or less": false,
"Better late than sorry": false,
"Don't talk to strangers when your mouth is full": false,
"Let's burn the bridge when we get there": false
};


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
  children: [
      
          RadioListTile(
              title: Text("Haters gonna hate", style: TextStyle(color: Colors.white)),
              value: "Haters gonna hate", 
              groupValue: widget.choice, 
              onChanged: (value){
                setState(() {
                    widget.choice = value.toString();
                });
                widget.callback(widget.choice);
              },
          ),

          RadioListTile(
              title: Text("Bakers gonna Bake", style: TextStyle(color: Colors.white)),
              value: "Bakers gonna Bake", 
              groupValue: widget.choice, 
              onChanged: (value){
                setState(() {
                    widget.choice = value.toString();
                });
                widget.callback(widget.choice);
              },
          ),

          RadioListTile(
                title: Text("If cannot be, borrow one from three", style: TextStyle(color: Colors.white)),
                value: "If cannot be, borrow one from three", 
                groupValue: widget.choice, 
                onChanged: (value){
                  setState(() {
                      widget.choice = value.toString();
                  });
                  widget.callback(widget.choice);
                },
          ),

          RadioListTile(
              title: Text("Less is more, more or less", style: TextStyle(color: Colors.white)),
              value: "Less is more, more or less", 
              groupValue: widget.choice, 
              onChanged: (value){
                setState(() {
                    widget.choice = value.toString();
                });
                widget.callback(widget.choice);
              },
          ),

          RadioListTile(
              title: Text("Better late than sorry", style: TextStyle(color: Colors.white)),
              value: "Better late than sorry", 
              groupValue: widget.choice, 
              onChanged: (value){
                setState(() {
                    widget.choice = value.toString();
                });
                widget.callback(widget.choice);
              },
          ),

          RadioListTile(
                title: Text("Don't talk to strangers when your mouth is full", style: TextStyle(color: Colors.white)),
                value: "Don't talk to strangers when your mouth is full", 
                groupValue: widget.choice, 
                onChanged: (value){
                  setState(() {
                      widget.choice = value.toString();
                  });
                  widget.callback(widget.choice);
                },
          ),

          RadioListTile(
                title: Text("Let's burn the bridge when we get there", style: TextStyle(color: Colors.white)),
                value: "Let's burn the bridge when we get there", 
                groupValue: widget.choice, 
                onChanged: (value){
                  setState(() {
                      widget.choice = value.toString();
                  });
                  widget.callback(widget.choice);
                },
          )
        ],
        )
        ],
      ),
    );
  }


}
