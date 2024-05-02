import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/slam_model.dart';
import '../api/firebase_slam_api.dart';

class SlamListProvider with ChangeNotifier {//provider for slam
  FirebaseSlamAPI firebaseService = FirebaseSlamAPI();
  late Stream<QuerySnapshot> _slamsStream;

  SlamListProvider() {
    fetchSlams();
  }

  // getter
  Stream<QuerySnapshot> get slam => _slamsStream;


  void fetchSlams() {//gets slam entry data
    _slamsStream = firebaseService.getAllSlams();
    notifyListeners();
  }


  void addSlam(Slam item) async {//adds a new slam entry
    String message = await firebaseService.addSlam(item.toJson(item));
    print(message);
    notifyListeners();
  }

  void deleteSlam(String id) async {//deletes slam entry
    String message = await firebaseService.deleteSlam(id);
    print(message);
    notifyListeners();
  }

  void editSlam(String id, String newNickname, String newAge) async {//edits slam entry
    await firebaseService.editSlam(id, newNickname, newAge);
    notifyListeners();
  }
}