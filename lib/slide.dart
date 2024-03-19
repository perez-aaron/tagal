import 'package:flutter/material.dart';
//ignore: must_be_immutable
class slide extends StatefulWidget {
  slide(this.callback, {super.key});
  final Function callback;
  double _value = 1;
  //function for resetting _value
  static void reset(slide bslide){
    bslide._value = 1;
  }

  @override
  State<slide> createState() => _slidestate();
}

class _slidestate extends State<slide> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: Slider(//values of slider
              min: 1.0,
              max: 10.0,
              value: widget._value,
              divisions: 9,
              label: '${widget._value.round()}',
              onChanged: (val) {
                setState(() {
                  widget._value = val;
                });
                widget.callback(widget._value);
              },
            ),
        )
      ]
    );
  }
}
