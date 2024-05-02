import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//widget for getting age
class Age extends StatefulWidget 
{
  final Function callback;
  const Age(this.callback, {super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> 
{

  final _controller2 = TextEditingController();

  @override
  void dispose() 
  {
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column
      (
        children: 
        [
          TextFormField(
            onSaved: (val) 
            {
              print("Text value: ${val!}");
              widget.callback(_controller2.text);
            },
            validator: (val) 
            {
              if (val == null || val.isEmpty) return "Enter a number";
            },
            controller: _controller2,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],//has formatter to only accept number input
            decoration: InputDecoration
            (
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                labelText: "Age",
                hintText: "Enter your age"),
          ),
        ],
      ),
    );
  }
}