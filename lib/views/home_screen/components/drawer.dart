import 'package:chat/consts/consts.dart';
import 'package:chat/main.dart';
import 'package:chat/views/chat_screen/chat_screen.dart';
import 'package:chat/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


Widget drawer() {
  return Drawer(
    backgroundColor: bgColor.withOpacity(0.8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(2)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ).onTap(() {
              Get.back();
            }),
          ),
          20.heightBox,
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 45,
            backgroundImage: AssetImage(ic_user), // Sử dụng backgroundImage
          ),
          10.heightBox,
          "Username".text.white.size(35).make(),

          20.heightBox,
          const Divider(color: Colors.cyan, height: 0.5),
          ListView(
            shrinkWrap: true,
            children: List.generate(
              drawerIconsList.length,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(
                        () => const ProfileScreen(),
                        transition: Transition.downToUp,
                      );
                      break;
                    default:
                  }
                },
                leading: Icon(drawerIconsList[index], color: Colors.white),
                title: "${drawerListTitle[index]}".text.white.make(),
              ),
            ),
          ),
          10.heightBox,
          const Divider(color: btnColor, height: 1),
          10.heightBox,
          ListTile(
            leading: const Icon(
              Icons.interpreter_mode_outlined,
              color: Colors.white,
            ),
            title: invite.text.white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async{
              await auth.signOut();
                  Get.offAll(() => const ChatApp());
            },
            leading: const Icon(Icons.logout, color: Colors.white),
            title: logout.text.white.make(),
          ),
        ],
      ),
    ),
  );
}
