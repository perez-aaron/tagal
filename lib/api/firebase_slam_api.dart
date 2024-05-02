import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseSlamAPI {
static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addSlam(Map<String, dynamic> slam) async {//adds slam entry to db
    try {
      await db.collection("slams").add(slam);

      return "Successfully added slam entry!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllSlams() {//gets all slam entries from db
    return db.collection("slams").snapshots();
  }

  Future<String> deleteSlam(String id) async {//deletes slam entry from db
    try {
      await db.collection("slams").doc(id).delete();

      return "Successfully deleted!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  Future<String> editSlam(String id, String nickname, String age) async {//edits slam entry on db
    try {
      await db.collection("slams").doc(id).update({"nickname": nickname, "age": age});

      return "Successfully edited!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }
}


