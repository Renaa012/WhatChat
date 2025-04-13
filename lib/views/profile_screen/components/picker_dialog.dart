import 'package:chat/consts/consts.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chat/controller/profile_controller.dart';

Widget pickerDialog(context, controller){
  var listTitle =["camera", " gallery","cancel"];
  var icons =[Icons.camera_alt_rounded, Icons.photo_size_select_actual, Icons.cancel];
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)
    ),
    child: Container(
      color: bgbColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          source.text.white.make(),
          Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children:
              List.generate(3, (index) => ListTile(
                onTap: (){
                  switch(index){
                    case 0:
                      Get.back();
                      controller.pickImage(context, ImageSource.camera);
                      break;
                    case 1:
                      Get.back();
                      controller.pickImage(context, ImageSource.gallery);
                      break;
                    case 2:
                      Get.back();
                      break;
                    default:
                  }
                },
                leading: Icon(icons[index]),
                title: listTitle[index].text.white.make(),
              )),
          ),
        ],
      ),
    ),
  );
}