import 'package:cloud_firestore/cloud_firestore.dart';

class FieldAccess {
  static getSingleField(
      String field, String documentId, String collection) async {
    FirebaseFirestore ref = FirebaseFirestore.instance;
    final snapShotDoc = ref.collection(collection).doc(documentId);
    DocumentSnapshot snapshot = await snapShotDoc.get();
    return (snapshot.data()[field]);
  }
}
