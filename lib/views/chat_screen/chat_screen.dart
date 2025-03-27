import 'package:chat/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgwColor.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              const CircleAvatar(// Màu nền cho avatar
                backgroundImage: AssetImage(ic_user), // Hình ảnh người dùng
              ),
              const SizedBox(width: 10),
              Expanded(
                // Sử dụng Expanded để chiếm không gian còn lại
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Username", // Thay thế bằng tên người dùng
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "last seen", // Thay thế bằng trạng thái
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(Icons.call, color: btnColor),
              const SizedBox(width: 10),
              Icon(Icons.video_call_rounded, color: btnColor),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.black),
            onPressed: () {
              // Hành động cho nút thêm
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        decoration: const BoxDecoration(color: bgwColor),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              30.heightBox,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Directionality(
                    textDirection:
                        index.isEven ? TextDirection.rtl : TextDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          ClipOval(
                            // Đảm bảo hình ảnh được cắt tròn
                            child: Image.asset(ic_user, width: 40, height: 40),
                          ),
                          20.widthBox,
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index.isEven ? bgbColor : btnColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                    "heloo   asdb   askdn  ooooooooooooooooo"
                                        .text
                                        .white
                                        .make(),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: "11:00 AM".text.gray400.size(12).make(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60, // Chiều cao cố định cho bottom navigation
        decoration: BoxDecoration(color: bgwColor.withOpacity(0.9)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            
            children: [
              Expanded(
                child: Container(
                  height: 40, // Điều chỉnh chiều cao của TextFormField
          
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontFamily: bold),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.emoji_emotions_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.attachment_rounded,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: "Type message here....",
                      hintStyle: TextStyle(
                        fontFamily: bold,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              10.widthBox,
                 Icon(Icons.send, color: btnColor,),

            ],
          ),
        ),
      ),
    );
  }
}
