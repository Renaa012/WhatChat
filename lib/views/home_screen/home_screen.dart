import 'package:chat/consts/colors.dart';
import 'package:chat/views/home_screen/components/tabbar.dart';
import 'package:chat/views/home_screen/components/tabbarview.dart';
import 'package:chat/views/home_screen/home.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: DefaultTabController(
        length: 3,
          child: Scaffold(
            key: scaffoldKey,
            drawer: drawer(),
            //nút góc dưới bên phải
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: bgColor,
            //   onPressed: () {},
            //   child: const Icon(Icons.add),
            // ),
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
