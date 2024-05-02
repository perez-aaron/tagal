//Aaron Jacob C. Perez
//2022 - 69580
//updated to only have class MainForm
//void main is in main
import '/nickname.dart';
import '/Age.dart';
import '/switchbutton.dart';
import '/radiobutton.dart';
import 'package:flutter/material.dart';
import '/dropdown.dart';
import '/slide.dart';
import 'name.dart';
import 'friendsummary.dart';
import 'main.dart';


class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final _formKey = GlobalKey<FormState>();
  bool showText = false;
  String text = "";
  String text2 = "";//initialized values
  String text3 = "";
  double _value = 1;
  bool _inRelationship = false;
  String _super = "Makalipad";
  String _motto = "Haters gonna hate";

  late Age bage;
  late radiobutton bradio;
  late switchbutton bswitch;//for the objects
  late dropdown bdrop;
  late slide bslide;

  void reset(){//for resetting all values
    setState(() {
      text = "";
      text2 = "";
      text3 = "";
      _inRelationship = false;
      _value = 1;
      _super = "Makalipad";
      _motto = "Haters gonna hate";
    });
  }


  @override
  Widget build(BuildContext context) {//initialzied values
    bage = Age((String val) => text3 = val);
    bradio = radiobutton((String val) => _motto = val);
    bswitch = switchbutton((bool val) => _inRelationship = val);
    bdrop = dropdown((String val) => _super = val);
    bslide = slide((double val) => _value = val);


    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),),
            const Text("The Tita Slambook", style: TextStyle(fontSize: 25, fontFamily: "Arial", color: Colors.white)),
            Name((String val) => text = val),//name
            Nickname((String val) => text2 = val),//nickname
            
            
              Row(mainAxisSize: MainAxisSize.min, children: [//age
                Container(width: 120, child: bage),
                Flexible(child: bswitch),
              ]
              ),
            
            Text("Happiness Slider", style: TextStyle(color: Colors.white, fontSize: 20),),
            Text("On a scale of 0 (Sadboi) - 10 (Hapi). Gaano ka kalungkot?", style: TextStyle(color: Colors.white, fontSize: 14),),

            bslide,//slider


            bdrop,//dropdown
            Text("Motto", style: TextStyle(color: Colors.white, fontSize: 20),),

            bradio,//radio

            Container(
              margin: EdgeInsets.all(30),
              
              child: OutlinedButton(style: ButtonStyle(//stylizing done button
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.green;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.yellow;
            }
            return Colors.transparent;
          }),),
                  
                  onPressed: () {//For done button logic
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      setState(() {

                        showText = true;

                        SumData sd = SumData(text, text2, text3, _inRelationship, _value, _super, _motto);
                        NavApp.sumdata.add(sd);

                        bage = Age((String val) => text3 = val);
                        bradio = radiobutton((String val) => text3 = val);
                        bswitch = switchbutton((bool val) => _inRelationship = val);
                        bdrop = dropdown((String val) => _super = val);
                        bslide = slide((double val) => _value = val);

                        _formKey.currentState?.reset();

                      });
                    }
                  },
                  child: const Text("Done")),
            ),


            const Divider(thickness: 0.5),

            Container(//Summary showing all the submitted values in the form field
              child: Column(
                children: [
                  showText ? Text("Summary", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),) : Container(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Name:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),) : Container(),
                    showText ? SizedBox(width: 150, child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Nickname:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    showText ? SizedBox(width: 150,child: Text(text2, style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Age:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    showText ? SizedBox(width: 150,child: Text(text3, style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Happiness:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    showText ? SizedBox(width: 150, child: Text(_value.toString(), style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Relationship status:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    if(_inRelationship == true)
                      showText ? SizedBox(width: 150,child: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 16),)) : Container()
                    else
                      showText ? SizedBox(width: 150,child: Text("No", style: TextStyle(color: Colors.white, fontSize: 16),)) : Container()
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Superpower:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    showText ? SizedBox(width: 150,child: Text(_super, style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    showText ? Text("Motto:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)) : Container(),
                    showText ? SizedBox(width: 150,child: Text(_motto, style: TextStyle(color: Colors.white, fontSize: 16),)) : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            Container(//For reset button
              margin: EdgeInsets.all(20),
              child: OutlinedButton(
                style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.red;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.yellow;
            }
            return Colors.transparent;
          }),),
                  onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      reset();
                      showText = false;
                      switchbutton.reset(bswitch);
                      radiobutton.reset(bradio);
                      dropdown.reset(bdrop);
                      slide.reset(bslide);
                    });
                  },
                  child: Text("Reset")),
            ),
          ],
        ),
      ),
    );
  }
}
