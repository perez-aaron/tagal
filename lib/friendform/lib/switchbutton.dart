import 'package:flutter/material.dart';
//widget for the switch button
//ignore: must_be_immutable
class switchbutton extends StatefulWidget {
  bool _isChecked = false;
  final Function callback;
  switchbutton(this.callback,{super.key});
  static void reset(switchbutton bswitch){//function for resetting this form
      bswitch._isChecked = false;
  }

  @override
  State<switchbutton> createState() => _switchbuttonState();
}

class _switchbuttonState extends State<switchbutton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(child: FormField(builder: (FormFieldState<bool> state) {
            return SwitchListTile(
                title: const Text("In a relationship?", style: TextStyle(color: Colors.white, fontSize: 14),),
                value: widget._isChecked,
                onChanged: (bool val) {
                  setState(() {
                    widget._isChecked = val;
                  });
                  widget.callback(widget._isChecked);
                });
          }))
        ],
      ),
    );
  }
}
