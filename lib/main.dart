import 'package:chat/consts/colors.dart';
import 'package:chat/consts/consts.dart';
import 'package:chat/consts/images.dart';
import 'package:chat/consts/strings.dart';
import 'package:chat/views/chat_screen/chat.dart';
import 'package:chat/views/home_screen/home_screen.dart';
import 'package:chat/views/sigin_screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as Fisebase;
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);


  @override
  State<App> createState() => _AppState();
}
  class _AppState extends State<App>{
  var isUser = false;
  checkUser()async{
    auth.authStateChanges().listen((User? user){
      if(user == null && mounted){
        setState(() {
          isUser =false;
        });
      }else{
        setState(() {
          isUser = true;
        });
      }
      print("user value í $isUser");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "lato"),
      debugShowCheckedModeBanner: false,
      home: isUser ? const HomeScreen() : ChatApp(),
      // home: const ChatApp(),
      title: appname,
    );
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo, width: 120),
                  appname.text.size(28).make(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    // Khoảng cách giữa slogan và danh sách chip
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children:
                      listOfFeatures.map((feature) {
                        return Chip(
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Vx.gray400),
                          label: Text(feature),
                        );
                      }).toList(),
                    ),
                    20.heightBox,
                    Text(
                      slogan, // Biến slogan đã được khởi tạo sẵn
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded(
            //   flex: 3,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Wrap(
            //         spacing: 10.0,
            //          children: List.generate(listOfFeatures.length, (index) {
            //           return Chip(
            //             labelPadding: const EdgeInsets.symmetric(
            //               horizontal: 18,
            //               vertical: 4,
            //             ),
            //             backgroundColor: Colors.transparent,
            //             side: const BorderSide(color: Vx.gray400),
            //             label: listOfFeatures[index].text.semiBold.make(),
            //           );
            //         }),
            //       ),
            //       20.heightBox,
            //       slogan.text.size(24).letterSpacing(1.5).color(Colors.red).make(),
            //
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    width: context.screenWidth ,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        Get.to(
                              () => const VerificationScreen(),
                          transition: Transition.downToUp,
                        );
                      },
                      child: cont.text.bold.black.size(20).make(),
                    ),
                  ),
                  10.heightBox,
                  poweredby.text.size(14).make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
