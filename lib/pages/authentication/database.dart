import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<void> addSubject(String id, Map<String, dynamic> subjectMap) {
    return FirebaseFirestore.instance
        .collection("subjects")
        .doc(id)
        .set(subjectMap);
  }
}
