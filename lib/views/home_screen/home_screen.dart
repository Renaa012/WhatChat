import 'package:chat/consts/colors.dart';
import 'package:chat/controller/home_controller.dart';
import 'package:chat/views/components_screen/compose.dart';
import 'package:chat/views/home_screen/components/tabbar.dart';
import 'package:chat/views/home_screen/components/tabbarview.dart';
import 'package:chat/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var controller =Get.put(HomeController());

    return SafeArea(
      child: DefaultTabController(
        length: 3,
          child: Scaffold(
            key: scaffoldKey,
            drawer: drawer(),
            //nút góc dưới bên phải
            floatingActionButton: FloatingActionButton(
              backgroundColor: bgColor,
              onPressed: () {
                Get.to(()=>ComposeScreen(), transition: Transition.downToUp);
              },
              child: const Icon(Icons.add),
            ),
            backgroundColor: bgColor,
            body: Column(
                children: [
                  appbar(scaffoldKey),
                  tabbarview(),

                ],
            ),
              bottomNavigationBar: tabbar()
          ),
        ),
    );
  }
}
