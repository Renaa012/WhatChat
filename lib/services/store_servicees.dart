import 'package:chat/consts/consts.dart';

class StoreServices{
  static getUser(String id){
    return firebaseFirestore.collection(collectionUser).where('id', isEqualTo: id).get();
  }

  static getAllUsers() {
    return firebaseFirestore.collection(collectionUser).snapshots();
  }
}