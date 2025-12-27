import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/app_colors.dart';
import 'package:civic_force/common_widget/button_single_atom.dart';
import 'package:civic_force/common_widget/container_decorated.dart';
import 'package:civic_force/common_widget/network_image_widget.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:civic_force/common_widget/textfield_atom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'controller_add_images.dart';
import 'web_view/web_view_screen.dart';

class AddImagesScreen extends StatelessWidget {
  const AddImagesScreen({super.key, this.id, this.name, this.isCity});
  final dynamic id;
  final dynamic name;
  final dynamic isCity;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAddImages(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Add ${isCity==true?"City":"Tag"} Image"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "${isCity==true?"City":"Tag"} name"),
              SizedBox(height: 2,),
              SmallText(text: "$name",size: 20,fontWeight: FontWeight.w600,),
              SizedBox(height: 36,),
              SmallText(text: "Enter url",fontWeight: FontWeight.w600,size: 15,),
              SizedBox(height: 8,),
              Row(spacing: 16,
                children: [
                  Expanded(child: TextFieldCommon(hintText: "Enter url",controller: controller.textEditingController,fillColor: Colors.white,)),
                  ContainerDecorated(onTap: (){
                    Get.to(()=>WebViewScreen(search: name,))!.then((onValue){
                      if(onValue!=null){
                        controller.textEditingController.text=onValue;
                        controller.update();
                      }
                    });
                  },borderRadius: 30,padding: 10,color: AppColors.primary,child: FaIcon(FontAwesomeIcons.pinterest,color: Colors.white,)),
                  ContainerDecorated(borderRadius: 30,padding: 10,color: AppColors.primary,child: FaIcon(FontAwesomeIcons.google,color: Colors.white,)),
                  // FaIcon(FontAwesomeIcons.google),
                ],
              ),

              SizedBox(height: 36,),
              Row(spacing: 8,children: [
                for(var x in [1,2,3,4,5,6,7,8,9,0])
                  Expanded(child: ContainerDecorated(height: 1,width: 20,color: Colors.black38,)),
                SmallText(text: "Or"),
                for(var x in [1,2,3,4,5,6,7,8,9,0])
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
                ImageCommon( "${controller.selectedImage}",height: 50,width: 50,borderRadius: 10,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 4,children: [
                    SmallText(text: "${controller.selectedImage}".split("/").last,fontWeight: FontWeight.w500,),
                    // SmallText(text: "2 MB",color: Colors.black54,)
                  ],),
                ),
                InkWell(onTap: (){
                  controller.selectedImage=null;
                  controller.update();
                },child: Icon(Icons.delete_outline,color: Colors.black54,))
              ],),),

            ],),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "Submit",tap: (){
              controller.putData(id: '$id',isCity: isCity);
            },)
          ],
        );
      }
    );
  }
}
