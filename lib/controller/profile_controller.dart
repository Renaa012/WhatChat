import 'dart:async';
import 'dart:io';

import 'package:chat/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{
  var nameController = TextEditingController();
  var aboutController = TextEditingController();
  var phoneController = TextEditingController();

  var imgpath=''.obs;
  var imglink='';

  updateProfile(context)async{
    var store = firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,

    }, SetOptions(merge: true));
    VxToast.show(context, msg: "Profile updated successfully!");
  }

  pickImage(context, source) async {
    //get permission from user
    await Permission.photos.request();
    await Permission.camera.request();
    //getting state of our permission tô handle
    var status = await Permission.photos.status;

    //handle status
    if(status.isGranted){
      try{
        // source will be accordiing to user choice
        // picking image and save in img variable
        final img =await ImagePicker().pickImage(source: source, imageQuality: 80);
        // seting our variable equa to thí image path
        imgpath.value = img!.path;
        VxToast.show(context, msg: "image selected");

      }on PlatformException catch(e){
        VxToast.show(context, msg: e.toString());
      }
    }else{ VxToast.show(context, msg: "Permission denied");
  }
  }
  // uploadImage() async{
  //   var name  = basename(imgpath.value);
  //   //setting destination of file on firestorage
  //   //it will create a path in storage with images folder
  //   // and in that folder it will creater a folder ith curent user id
  //   var destination = 'images/${currentUser!.uid}/$name';
  //   Reference ref = FirebaseStorage.instance.ref().child(destination);
  //   await ref.putData(File(imgpath.value));
  // }


}