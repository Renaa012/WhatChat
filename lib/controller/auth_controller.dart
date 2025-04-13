import 'package:chat/consts/consts.dart';
import 'package:chat/views/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  var isOtpSent = false.obs;
  var formKey = GlobalKey<FormState>();

  // Auth variables
  late PhoneVerificationCompleted phoneVerificationCompleted;
  late PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = '';

  // Gửi OTP
  Future<void> sendOtp() async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };

    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    };

    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+84${phoneController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Error sending OTP: ${e.toString()}");
    }
  }

  // Xác minh OTP
  Future<void> verifyOtp(context) async {
    String otp = otpController.map((controller) => controller.text).join();

    try {
      PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otp);
      User? user = (await auth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        DocumentReference store =
        FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set({
          'id': user.uid,
          'name': usernameController.text.trim(),
          'phone': phoneController.text.trim(),
          'about': '',
          'image_url':'',
        }, SetOptions(merge: true));

        VxToast.show(context, msg: loggedin);
        Get.offAll(() => const HomeScreen(), transition: Transition.downToUp);
      }
    } catch (e) {
      VxToast.show(context, msg: logout);
    }
  }
}
