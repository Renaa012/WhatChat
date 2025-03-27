import 'package:chat/consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: proflie.text.fontFamily(bold).white.make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: btnColor,
                radius: 80,
                child: Stack(
                  children: [
                    ClipOval( // Đảm bảo hình ảnh được cắt tròn
                      child: Image.asset(
                        ic_user,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 20,
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),// Sử dụng backgroundImage
              ),
              10.heightBox,
              ListTile(
                leading: Icon(
                  Icons.person, color: Colors.white,

                ),
                title: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(
                      Icons.edit, color: Colors.white,
                    ),
                    label: "Name".text.make(),
                    isDense: true,
                    labelStyle: const TextStyle(fontFamily: bold, color: Colors.white)
                  ),
                ),
                subtitle: namesub.text.fontFamily(bold).gray600.make(),
              ),
              10.heightBox,
              ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.edit, color: Colors.white,
                      ),
                      label: "About".text.make(),
                      isDense: true,
                      labelStyle: const TextStyle(fontFamily: bold, color: Colors.white)
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.call, color: Colors.white,),
                title: TextFormField(
                  readOnly: true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.edit, color: Colors.white,
                      ),
                      label: "Call".text.make(),
                      isDense: true,
                      labelStyle: const TextStyle(fontFamily: bold, color: Colors.white)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
