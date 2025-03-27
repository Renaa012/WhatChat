import 'package:chat/consts/colors.dart';
import 'package:chat/consts/images.dart';
import 'package:chat/consts/strings.dart';
import 'package:chat/consts/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appbar(GlobalKey<ScaffoldState> key) {
  return Container(
    padding: const EdgeInsets.only(right: 12),
    height: 80,
    color: Colors.white.withOpacity(0.9),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState?.openDrawer(); // Sử dụng ? để tránh lỗi null
          },
          child: Container(
            height: 80,
            width: 80,
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 40, // Tăng kích thước icon
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$appname\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$connectingLives",
                style: TextStyle(
                  fontFamily: bold,
                  fontSize: 14,
                  color: Vx.gray600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: bgColor,
          radius: 25,
          backgroundImage: AssetImage(ic_user), // Sử dụng backgroundImage
        ),
      ],
    ),
  );
}