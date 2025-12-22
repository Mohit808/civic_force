import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'controller_add_images.dart';

class AddImagesScreen extends StatelessWidget {
  const AddImagesScreen({super.key, this.tagId, this.tagName});
  final dynamic tagId;
  final dynamic tagName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAddImages(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Add Image"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "Enter url",fontWeight: FontWeight.w600,size: 15,),
              SizedBox(height: 8,),
              TextFieldCommon(hintText: "Enter url",controller: controller.textEditingController,),

              SizedBox(height: 36,),
              Row(spacing: 8,children: [
                for(var x in [1,2,3,4,5,6,7,8,9])
                  Expanded(child: ContainerDecorated(height: 1,width: 20,color: Colors.black38,)),
                SmallText(text: "Or"),
                for(var x in [1,2,3,4,5,6,7,8,9])
                  Expanded(child: ContainerDecorated(height: 1,width: 20,color: Colors.black38,)),
              ],),
              SizedBox(height: 36,),
              ContainerDecorated(onTap: () async {
                var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                if(xFile!=null){
                  controller.selectedImage=xFile.path;
                  controller.update();
                }

              },paddingEdgeInsets: EdgeInsets.symmetric(vertical: 36,horizontal: 16),child: Column(children: [
                Row(),
                ContainerDecorated(color: Colors.white,padding: 16,child: Icon(Icons.cloud_upload_outlined,size: 30,)),
                SizedBox(height: 16,),
                SmallText(text: "Drop your files here or browse",size: 16,fontWeight: FontWeight.w600,),
                SizedBox(height: 4,),
                SmallText(text: "Max file upto 2mb",color: Colors.black54,),

              ],),),

              SizedBox(height: 16,),

              if(controller.selectedImage!=null)ContainerDecorated(padding: 8,color: Colors.white,colorBorder: Colors.grey.shade400,child: Row(spacing: 16,children: [
                ImageCommon(src: "${controller.selectedImage}",height: 50,width: 50,fit: BoxFit.cover,borderRadius: 10,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                    SmallText(text: "${controller.selectedImage}",fontWeight: FontWeight.w500,),
                    // SmallText(text: "2 MB",color: Colors.black54,)
                  ],),
                ),
                InkWell(onTap: (){
                  controller.selectedImage=null;
                  controller.update();
                },child: Icon(Icons.delete_outline,color: Colors.black54,))
              ],),)

            ],),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "Submit",tap: (){
              controller.putData(id: '$tagId');
            },)
          ],
        );
      }
    );
  }
}
