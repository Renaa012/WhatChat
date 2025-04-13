import 'package:chat/consts/consts.dart';
import 'package:chat/controller/profile_controller.dart';
import 'package:chat/services/store_servicees.dart';
import 'package:chat/views/profile_screen/components/picker_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: proflie.text.fontFamily(bold).white.make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              controller.updateProfile(context);
            },
            child: "save".text.make(),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: FutureBuilder<QuerySnapshot>(
          future: StoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('Không có dữ liệu'));
            }

            var data = snapshot.data!.docs.first;
            controller.nameController.text = data['name'];
            controller.phoneController.text = data['phone'];
            controller.aboutController.text = data['about'];

            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: btnColor,
                  radius: 80,
                  child: Stack(
                    children: [

                      ClipOval(
                        child: Image.asset(ic_user),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 20,
                        child: CircleAvatar(
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ).onTap(() {
                            Get.dialog(pickerDialog(context, controller));
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                10.heightBox,
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: TextFormField(
                    controller: controller.nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.edit, color: Colors.white),
                      label: "Name".text.make(),
                      isDense: true,
                      labelStyle: const TextStyle(fontFamily: bold, color: Colors.white),
                    ),
                  ),
                  subtitle: namesub.text.fontFamily(bold).gray600.make(),
                ),
                10.heightBox,
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: TextFormField(
                    controller: controller.aboutController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.edit, color: Colors.white),
                      label: "About".text.make(),
                      isDense: true,
                      labelStyle: const TextStyle(fontFamily: bold, color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.call, color: Colors.white),
                  title: TextFormField(
                    controller: controller.phoneController,
                    readOnly: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.edit, color: Colors.white),
                      label: "Call".text.make(),
                      isDense: true,
                      labelStyle: const TextStyle(fontFamily: bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}