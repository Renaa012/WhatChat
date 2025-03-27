import 'package:chat/consts/consts.dart';
import 'package:chat/views/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var otpController = List.generate(6, (index)=> TextEditingController());

  var isOtpSent = false.obs;
  //auth variable
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID ='';


  //goi otp method
  sendOtp()async{
    phoneVerificationCompleted =(PhoneAuthCredential credential) async{
      await auth.signInWithCredential(credential);};

    phoneVerificationFailed =(FirebaseAuthException e ){
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    };

    phoneCodeSent =( String verficationId, int? resendToken){
      verificationID =verficationId;
    };
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: "+84${phoneController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }catch(e){
      print(e.toString());
    }
  }

  verifyOtp(context)async{
    String otp ="";
    for( var i=0 ; i<otpController.length; i++){
      otp += otpController[i].text;
    }
    try{
      PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otp);
      final User? user =(await auth.signInWithCredential(phoneAuthCredential)).user;

      if(user!=null){
        DocumentReference store = FirebaseFirestore.instance.collection(collectionUser).doc(
          user.uid);
        await store.set({
        'id': user.uid,
        'name': usernameController.text.toString(),
        'phone': phoneController.text.toString(),
        }, SetOptions(merge: true));
        
        VxToast.show(context, msg: loggedin);
        Get.offAll(()=> const HomeScreen(), transition: Transition.downToUp);
      }
    }catch(e){
      VxToast.show(context, msg: logout);
    }
  }


  
}