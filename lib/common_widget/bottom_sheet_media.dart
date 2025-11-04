
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/camera_upload/camera_upload_screen.dart';

class BottomSheetMedia extends StatelessWidget {
  const BottomSheetMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        InkWell(onTap: () async {
          XFile? xFile=await ImagePicker().pickImage(source: ImageSource.camera);
          if(xFile!=null) {
            Get.back();
            Get.to(() => CameraUploadScreen(image: xFile.path,));
          }
        },
          child: Row(spacing: 16,children: [
            ContainerDecorated(padding: 8,borderRadius: 40,color: AppColors.primary,child: Icon(Icons.camera_alt,color: Colors.white,size: 16,)),
            SmallText(text: "Camera",fontWeight: FontWeight.w600,size: 14,)
          ],),
        ),
        Divider(height: 24,),
        InkWell(onTap: () async {
          XFile? xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
          if(xFile!=null){
            Get.back();
            Get.to(()=>CameraUploadScreen(image: xFile.path,));
            // controller.selectedImage=xFile.path;
            // controller.update();
          }

        },
          child: Row(spacing: 16,children: [
            ContainerDecorated(padding: 8,borderRadius: 40,color: AppColors.primary,child: Icon(Icons.image_rounded,color: Colors.white,size: 16,)),
            SmallText(text: "Gallery",fontWeight: FontWeight.w600,size: 14,)
          ],),
        ),
        SizedBox(height: 24,)
      ],),
    );
  }
}
