import 'package:chat/views/home_screen/components/chats_componemt.dart';
import 'package:chat/views/home_screen/components/status_components.dart';
import 'package:flutter/material.dart';

Widget tabbarview() {
  return Expanded(
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12)),
      ),
      child: TabBarView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
              child: chatsComponent()),
          Container(color: Colors.red),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: statusComponent(),
          ),
        ],
      ),
    ),
  );
}
