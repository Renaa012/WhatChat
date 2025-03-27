import 'package:chat/consts/colors.dart';
import 'package:chat/consts/images.dart';
import 'package:chat/consts/strings.dart';
import 'package:chat/views/chat_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget chatsComponent() {
  return Column(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Vx.gray200,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ChatScreen(), transition: Transition.downToUp);
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      ic_user,
                    ), // Sử dụng backgroundImage thay vì child
                  ),
                  title: "Dungmy name".text.bold.size(16).make(),
                  subtitle: "messagen in here..".text.make(),
                  trailing: "last seen".text.gray400.make(),
                ),
              );
            },
          ),
        ),
      ),

    ],
  );
}