//for editing

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exer5/models/slam_model.dart';
import 'package:exer5/providers/slam_provider.dart';


class SlamEdit extends StatelessWidget {
  String type;
  Slam? item;

  TextEditingController _formFieldController = TextEditingController();
   TextEditingController _formFieldController2 = TextEditingController();

  SlamEdit({super.key, required this.type, required this.item});

  // Method to show the title of the modal depending on the functionality
  Text _buildTitle() {
    switch (type) {

      case 'Edit':
        return const Text("Edit todo");
    
      default:
        return const Text("");
    }
  }

  // Method to build the content or body for edit
  Widget _buildContent(BuildContext context) {
    switch (type) {
      default:
        return 
        Column(
          children: [Text("Nickname"),
            TextField(
              style: TextStyle(color: const Color.fromARGB(255, 15, 15, 15)),
              controller: _formFieldController, 
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
            ),
            Text("Age"),
            TextField(
              style: TextStyle(color: const Color.fromARGB(255, 12, 12, 12)),
              controller: _formFieldController2, 
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );
    }
  }

  TextButton _dialogAction(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (type) {
        
          case 'Edit':
            {
              context
                  .read<SlamListProvider>()
                  .editSlam(item!.id!, _formFieldController.text, _formFieldController2.text );

              // Remove dialog after editing
              Navigator.of(context).pop();
              break;
            }
        }
      },
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: Text(type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: _buildContent(context),

      // Contains two buttons - add/edit/delete, and cancel
      actions: <Widget>[
        _dialogAction(context),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
