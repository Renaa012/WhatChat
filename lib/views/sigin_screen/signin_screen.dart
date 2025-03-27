import 'package:chat/consts/consts.dart';
import 'package:chat/consts/strings.dart';
import 'package:chat/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../home_screen/home_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: letsconnect.text.fontWeight(FontWeight.bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [

              // username
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Vx.gray400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Vx.gray400),
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                    color: Vx.gray400,
                  ),
                  alignLabelWithHint: true,
                  labelText: "User name",
                  hintText: " SyTihz",
                  labelStyle: TextStyle(
                    color: Vx.gray600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.heightBox,

              // phone
              TextFormField(
                controller: controller.phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Vx.gray400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Vx.gray400),
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                    color: Vx.gray400,
                  ),
                  alignLabelWithHint: true,
                  labelText: "phone number",
                  prefixText: "+84 ",
                  hintText: " 1234567890",
                  labelStyle: TextStyle(
                    color: Vx.gray600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              10.heightBox,
              otp.text.size(16).make(),

              // otp
              Obx(()=>
                Visibility(
                  visible: controller.isOtpSent.value,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: List.generate(6,  (index)=> SizedBox(
                        width: 56,
                        child: TextField(
                          controller: controller.otpController[index],
                          cursorColor: btnColor,
                          onChanged: (value){
                            if(value.length ==1 && index <=5){
                              FocusScope.of(context).nextFocus();
                            }else if(value.isEmpty && index >0){
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          style: TextStyle(
                            fontFamily: bold,
                            color: btnColor,
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: bgbColor,
                              ),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: bgbColor)
                            ),
                            hintText: "*"
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ),


              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth ,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () async {
                      if( controller.isOtpSent.value == false){
                        controller.isOtpSent.value = true;
                        await controller.sendOtp();
                      }else{
                        await controller.verifyOtp(context);

                      }
                      controller.isOtpSent.value= true;
                      await controller.sendOtp();

                      // Get.to(
                      //   () => const HomeScreen(),
                      //   transition: Transition.downToUp,
                      // );
                    },
                    child: continueText.text.black.bold.size(20).make(),
                  ),
                ),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
