import 'package:chat/consts/consts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //initialize it late
  late SharedPreferences prefs;
  static HomeController instance = Get.find();

  getUsersDetails() async {
    await firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) async{
          prefs = await SharedPreferences.getInstance();
      prefs.setStringList('user_details', [
        value.docs[0]['name'],
      value.docs[0]['image_url'],
      ]);
    });
  }
  @override
  void onInit() {
    getUsersDetails();
    super.onInit();
  }
}
