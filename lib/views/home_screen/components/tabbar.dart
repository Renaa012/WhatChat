import 'package:chat/consts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts/strings.dart';

Widget tabbar() {
  return Container(
    color: Colors.white.withOpacity(0.9),
    child: const TabBar(
      tabs: [
        Tab(
          icon: Icon(
            Icons.chat,
            color: Colors.grey, // Màu của icon
          ),
          // Thêm style cho text bằng cách sử dụng Tab.text
          child: Text(
            chats,
            style: TextStyle(
              color: Colors.grey, // Đặt màu chữ giống với màu icon
            ),
          ),
        ),
        Tab(
          icon: Icon(Icons.group,color: Colors.grey),
          child: Text(
            friend,
            style: TextStyle(
              color: Colors.grey, // Đặt màu chữ giống với màu icon
            ),
          ),
        ),
        Tab(
          icon: Icon(Icons.update,color: Colors.grey),
          child: Text(
            status,
            style: TextStyle(
              color: Colors.grey, // Đặt màu chữ giống với màu icon
            ),
          ),
        ),
      ],
    ),
  );
}
