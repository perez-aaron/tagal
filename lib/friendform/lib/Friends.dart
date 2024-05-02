import 'package:flutter/material.dart';
import 'friendsummary.dart';
import '/drawer.dart';

class Friends extends StatefulWidget {
  const Friends({this.summarylist, super.key});
  final List<SumData>? summarylist;//list of all friends summary

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          "Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: widget.summarylist!.isNotEmpty ? //if not empty, list all friends
        ListView.builder(padding: const EdgeInsets.only(top: 10),

          itemCount: widget.summarylist!.length,
          itemBuilder: (BuildContext context, int index)
          {
            return Container
            (
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal:10),

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),),
              child:
               ListTile(
              title: Text(widget.summarylist![index].name),
              trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,//button for viewing summary
                ),
                child: 
                const Text("View Details", style: TextStyle(color: Colors.white)),
                onPressed:
                 () => Navigator.push(context, MaterialPageRoute(builder: (context) => friendsum(widget.summarylist![index].name, widget.summarylist![index].nickname, widget.summarylist![index].age, widget.summarylist![index].inRelationship, widget.summarylist![index].happinessLevel, widget.summarylist![index].superpower, widget.summarylist![index].motto,)),
                ))
            ));
          },)
          //else
          
        : Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Icon(Icons.group, color: Colors.white,),
              const Text("No friends added yet", style: TextStyle(color: Colors.white)),
              Container
              (
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(//button for going to slambook when empty list
                  style: 
                  ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                  ),
                  onPressed: () 
                  {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/second");
                  }, 
                  child: const Text("Go to slambook", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                ))]
          )),
    );
  }
}
