import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  final Function callback;
  const Name(this.callback, {super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            onSaved: (val) {
              print("Text value: ${val!}");
              widget.callback(_controller.text);
            },
            validator: (val) {   //checking of input     
              if (val == null || val.isEmpty) return "Enter a text";
            },
            controller: _controller,
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "Enter your name"),
          ),
        ],
      ),
    );
  }
}
