import 'package:chat/consts/consts.dart';
import 'package:chat/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  //variable for chat
  dynamic chatId;
  var chats = firebaseFirestore.collection(collectionChats);
  var userId = currentUser!.uid;
  var friendId = Get.arguments[1];
  // it will get the name from the pref 0 index
  var username = HomeController.instance.prefs.getStringList('user_details')?[0] ?? '';
  var friendname =Get.arguments[0];
  //text controller
  var messageController = TextEditingController();

  //creating chatroom
  getChatId()async{
    // it wwill see if ther is a chatroom already created between the 2 user
    await chats.where('users', isEqualTo: {
      friendId: null, userId: null
    }).limit(1).get().then((QuerySnapshot snapshot) async{
      if(snapshot.docs.isNotEmpty){
        chatId = snapshot.docs.single.id;
      }else{
        //if no room is created room
        chats.add({
          'users': {userId: null, friendId: null},
          'friend_name': friendname,
          'user_name': username,
          'toId': '',
          'fromId':'',
          'created_on': null,
          'last_msg':'',

        }).then((value){
          // assign the doc id to our chatid variable
          {
            chatId = value.id;

          }
          //let creates a chatroom
        });
      }
    });
  }
  sendmessage(String msg){
    if(msg.trim().isNotEmptyAndNotNull){
      chats.doc(chatId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_mg' : msg,
        'toId' : friendId,
        'fromId' : userId
      });
      
      chats.doc(chatId).collection(collectionMessages).doc().set({
        'create_on': FieldValue.serverTimestamp(),
        'smg' : msg,
        'uid' : userId,
        'fromId' :userId
      }).then((value){
        messageController.clear();
      });
    }
  }


  @override
  void onInit(){
    getChatId();
    super.onInit();
  }
}
