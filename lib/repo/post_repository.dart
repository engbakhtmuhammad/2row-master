import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  Future<bool> postData(data, bool isEvent) async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('download');
      CollectionReference event =
          FirebaseFirestore.instance.collection('event_reserve');

      isEvent ? await event.add(data) : await collectionRef.add(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
