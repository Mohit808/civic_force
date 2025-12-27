import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        Row(children: [
          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              var xFile=await ImagePicker().pickImage(source: ImageSource.camera,);
              if(xFile!=null){
                Get.back(result: [xFile]);
              }
            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.camera_alt_outlined)),
                SmallText(text: "Camera",fontWeight: FontWeight.w600,)
              ],),
            ),
          ),

          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              var xFiles=await ImagePicker().pickMultiImage(limit: 10);
              Get.back(result: xFiles);
            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.image_outlined)),
                SmallText(text: "Images",fontWeight: FontWeight.w600)
              ],),
            ),
          ),

          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              var xFiles=await ImagePicker().pickMultiVideo(limit: 10);
              Get.back(result: xFiles);

            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.videocam_outlined)),
                SmallText(text: "Videos",fontWeight: FontWeight.w600)
              ],),
            ),
          ),

          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              var xFiles=await ImagePicker().pickMultipleMedia(limit: 10);
              Get.back(result: xFiles);
            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.image_outlined)),
                SmallText(text: "Gallery",fontWeight: FontWeight.w600)
              ],),
            ),
          ),
        ],),

        SizedBox(height: 24,),

        Row(children: [
          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true,);
              if(result!=null)Get.back(result: result.files);
            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.picture_as_pdf_outlined)),
                SmallText(text: "Documents",fontWeight: FontWeight.w600,)
              ],),
            ),
          ),

          Expanded(flex: 1,
            child: InkWell(onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['mp3', 'wav', 'aac', 'm4a', 'ogg'],
                allowMultiple: true, // false if you want only one
              );

              if(result!=null)Get.back(result: result.files);
            },
              child: Column(spacing: 8,children: [
                ContainerDecorated(colorBorder: Colors.grey.shade400,padding: 16,child: Icon(Icons.audio_file_outlined)),
                SmallText(text: "Audio",fontWeight: FontWeight.w600)
              ],),
            ),
          ),

          Expanded(flex: 1,
            child: Column(spacing: 8,children: [
              ContainerDecorated(colorBorder: Colors.transparent,color: Colors.transparent,padding: 16,child: Icon(Icons.location_on_outlined,color: Colors.transparent,)),
              SmallText(text: "Location",fontWeight: FontWeight.w600,color: Colors.transparent,)
            ],),
          ),

          Expanded(flex: 1,
            child: Column(spacing: 8,children: [
              ContainerDecorated(color: Colors.transparent,colorBorder: Colors.transparent,padding: 16,child: Icon(Icons.contact_page_outlined,color: Colors.transparent,)),
              SmallText(text: "Contacts",fontWeight: FontWeight.w600,color: Colors.transparent,)
            ],),
          ),
        ],),

        SizedBox(height: 24,),
      ],),
    );
  }
}
