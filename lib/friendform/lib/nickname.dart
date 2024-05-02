import 'package:flutter/material.dart';
//widget for taking nickname
class Nickname extends StatefulWidget 
{
  final Function callback;
  const Nickname(this.callback, {super.key});

  @override
  State<Nickname> createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> 
{

  final _controller1 = TextEditingController();

  @override
  void dispose() 
  {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      margin: EdgeInsets.all(20),
      child: Column(
        children: 
        [
          TextFormField(
            onSaved: (val) 
            {
              print("Text value: ${val!}");
              widget.callback(_controller1.text);
            },
            validator: (val) 
            {
              if (val == null || val.isEmpty) return "Enter a text";
            },
            controller: _controller1,
            decoration: InputDecoration
            (
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                labelText: "Nickname",
                hintText: "Enter your nickname"),
          ),
        ],
      ),
    );
  }
}