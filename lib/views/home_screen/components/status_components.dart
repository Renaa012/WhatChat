import 'package:chat/consts/colors.dart';
import 'package:chat/consts/consts.dart';
import 'package:flutter/material.dart';
Widget statusComponent(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ListTile(
          leading: ClipOval( // Đảm bảo hình ảnh được cắt tròn
            child: Image.asset(
              ic_user,
                ),
              ),

          title: "My status".text.gray600.make(),
          subtitle: "tap to add status update".text.gray600.make(),
        ),
        20.heightBox,
        recentupdates.text.green400.make(),
        20.heightBox,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: btnColor, width: 3)
                  ),
                  child: ClipOval(
                    // Đảm bảo hình ảnh được cắt tròn
                    child: Image.asset(
                      ic_user,
                    ),
                  ),
                ),
                title: "Username".text.gray600.make(),
                subtitle: "today, 8:47 PM".text.gray600.make(),
              ),
            );

          },
        )
      ],
    ),
  );
}