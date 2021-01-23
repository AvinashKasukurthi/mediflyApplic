import 'package:cloud_firestore/cloud_firestore.dart';

class FieldAccess {
  getSingleField(String field, String documentId, String collection) async {
    FirebaseFirestore ref = FirebaseFirestore.instance;
    final snapShotDoc = ref.collection(collection).doc(documentId);
    DocumentSnapshot snapshot = await snapShotDoc.get();
    return (snapshot.data()[field]);
  }

  incrementSingleField(
      String field, String documentId, String collection) async {
    FirebaseFirestore ref = FirebaseFirestore.instance;
    final snapShotDoc = ref.collection(collection).doc(documentId);
    DocumentSnapshot snapshot = await snapShotDoc.get();
    int fieldUpdator = await snapshot.data()[field];
    fieldUpdator++;
    print(fieldUpdator);

    snapshot = await snapShotDoc.get();
    return fieldUpdator;
  }
}
