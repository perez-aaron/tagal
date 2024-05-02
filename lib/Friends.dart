import 'package:flutter/material.dart';
import 'friendsummary.dart';
import '/drawer.dart';
import 'package:provider/provider.dart';
import '../models/slam_model.dart';
import '../providers/slam_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'slam_edit.dart';

class Friends extends StatefulWidget {
  const Friends({this.summarylist, super.key});
  final List<SumData>? summarylist;//list of all friends summary

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> slamsStream = context.watch<SlamListProvider>().slam;//access slamlist

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          "Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: 
      // widget.summarylist!.isNotEmpty ? //if not empty, list all friends
      StreamBuilder(//stream builder instead of listtile
        stream: slamsStream,
        builder: (context, snapshot) {

            if (snapshot.hasError) {//catchers for errors
            return Center(
              child: Text("Error encountered! ${snapshot.error}"),
            );

          } 
            else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );

          }
           else if (!snapshot.hasData) {
            return const Center(
              child: Text("No Slam Entries Found"),
            );
          }

          return ListView.builder(padding: const EdgeInsets.only(top: 10),

          itemCount: snapshot.data?.docs.length, //makes use of snapshot
          itemBuilder: ((context, index)
          {
            Slam slam = Slam.fromJson(//building tiles
              snapshot.data?.docs[index].data() as Map<String, dynamic>);
              slam.id = snapshot.data?.docs[index].id;

              return Dismissible(
                key: Key(slam.id.toString()),
                onDismissed: (direction) {//if deleted
                  context.read<SlamListProvider>().deleteSlam(slam.name);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${slam.name} dismissed')));
                },
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    
                    tileColor: Color.fromARGB(255, 234, 222, 235),
                    title: Text(slam.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,//button for viewing summary
                        ),
                          child: 
                            const Text("View Details", style: TextStyle(color: Colors.white)),//pushes the slam item instead of the list
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => friendsum(slam.name, slam.nickname, slam.age, slam.status, slam.happiness, slam.superpower, slam.motto,)),
                        ),
                        ),

                        IconButton(//for editing button
                          onPressed: () {
                              showDialog(
                              context: context,
                              builder: (BuildContext context) => SlamEdit(
                                type: 'Edit',
                                item: slam,
                              ),
                            );
                          },
                          icon: const Icon(Icons.create_outlined),
                        ),
                        

                        IconButton(//for delete button
                          onPressed: () {
                            context.read<SlamListProvider>().deleteSlam(slam.id!);
                          },
                          icon: const Icon(Icons.delete_outlined),
                        )
                    ],
                    ),
                  ),
                ),
              );
          })
          ,);
        })
          //else

          //() => Navigator.push(context, MaterialPageRoute(builder: (context) => friendsum(slam.name, slam.nickname, slam.age, slam.status, slam.happiness, slam.superpower, slam.motto,)),
          
        // : Center
        // (
        //   child: Column
        //   (
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children:
        //     [
        //       const Icon(Icons.group, color: Colors.white,),
        //       const Text("No friends added yet", style: TextStyle(color: Colors.white)),
        //       Container
        //       (
        //         margin: const EdgeInsets.all(10),
        //         child: ElevatedButton(//button for going to slambook when empty list
        //           style: 
        //           ElevatedButton.styleFrom(
        //               backgroundColor: Colors.white,
        //           ),
        //           onPressed: () 
        //           {
        //             Navigator.pop(context);
        //             Navigator.pushNamed(context, "/second");
        //           }, 
        //           child: const Text("Go to slambook", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
        //         ))]
        //   )),
    );
  }
}
