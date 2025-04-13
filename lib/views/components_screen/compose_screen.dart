import 'package:chat/services/store_servicees.dart';
import 'package:chat/views/chat_screen/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/consts.dart';

class ComposeScreen extends StatelessWidget {
  final String? user;
  const ComposeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("New message", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: StoreServices.getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
              return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(bgColor),
                  )
              );
            }else{
              var docs = snapshot.data!.docs;
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 100,
                ),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  var doc = docs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: bgColor.withOpacity(0.1))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              children: [
                                CircleAvatar(
                                  // Màu nền cho avatar
                                  radius: 35,
                                  backgroundImage: NetworkImage("${doc['image_url']}" ), // Hình ảnh người dùng
                                ),
                                "${doc['name']}".text.bold.make(),
                              ]
                          ),
                          10.heightBox,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                              ),
                              onPressed: (){
                                //on tap of this button we
                                Get.to(() => ChatScreen(), transition: Transition.downToUp, arguments: [
                                  doc['name'],
                                  doc['id'],
                                ]);
                              },
                              icon: const Icon(Icons.message),
                              label: "message".text.make(),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            var docs = snapshot.data!.docs;

          },
        ),
      ),
    );
  }
}
