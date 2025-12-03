import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:croppy/croppy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../common_widget/app_bar.dart';
import '../../common_widget/button_single_atom.dart';
import '../../common_widget/container_decorated.dart';
import '../../common_widget/text_common.dart';
import '../../common_widget/textfield_atom.dart';
import '../../data_source/upload_to_s3.dart';
import '../../utils.dart';
import '../../utils/app_images.dart';
import 'controller_basic_details.dart';

class BasicDetailsScreen extends StatelessWidget {
  const BasicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBasicDetails(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBarCommon(centerTitle: false,title: SmallText(text: "Basic Details".tr,size: 20,fontWeight: FontWeight.w800,),elevation: 0,color: Colors.black,),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(width: isMobile()?Get.width:Get.width/3,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Column(children: [

                          SizedBox(height: 24,),
                          Stack(
                            children: [
                              ContainerDecorated(borderRadius: 100,padding: 0,color: Colors.black,colorBorder: Color(0xFF777778),child: ClipRRect(borderRadius: BorderRadius.circular(100),child: SizedBox(height: 100,width: 100,child: Image.network("${controller.image}",fit: BoxFit.cover,errorBuilder: (a,b,c)=>Image.asset(AppImages.user),),))),
                              Positioned(bottom: 0,right: 0,child: ContainerDecorated(onTap: () async {
                                XFile? xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(xFile==null) return;
                                final result = await showCupertinoImageCropper(Get.context!,
                                  imageProvider: FileImage(File(xFile.path)),
                                  allowedAspectRatios: [CropAspectRatio(width: 500, height: 500)]
                                );

                                if(result==null) return;
                                ui.Image image = result.uiImage;

                                final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                                final Uint8List pngBytes = byteData!.buffer.asUint8List();

                                img.Image? decodedImg = img.decodeImage(pngBytes);
                                Uint8List jpgBytes = img.encodeJpg(decodedImg!, quality: 70);

                                final dir = await getTemporaryDirectory();
                                final croppedPath = '${dir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.jpg';

                                final croppedFile = File(croppedPath);
                                await croppedFile.writeAsBytes(jpgBytes);
                                
                                // var value=await DataSourceCommon().checkImage(croppedPath);
                                // if(value!=true) return;
                                var url=await uploadImageToS3(croppedPath);
                                // var url=await uploadImageToS3(xFile.path);
                                if(url!=null){
                                  controller.image=url;
                                  controller.update();
                                }
                              },padding: 8,borderRadius: 40,color: Colors.red,child: Icon(Icons.edit,size: 16,color: Colors.white,)))
                            ],
                          ),

                          SizedBox(height: 36,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            SmallText(text: "Your name *".tr,color: Colors.white70,),
                            SizedBox(height: 8,),
                            Form(key: controller.formKey,child: TextFieldCommon(textCapitalization: TextCapitalization.words,controller: controller.textEditingController,BorderColor: Colors.transparent,hintText: "Enter Your name",borderRadius: 30,fillColor: Colors.white.withOpacity(0.2),colorText: Colors.white,colorHint: Colors.white.withOpacity(0.9),)),
                          ],),

                          SizedBox(height: 48,),
                          ButtonSingleAtom(status: controller.apiResponse.status,widget: "Submit".tr,tap: (){
                            controller.postData();
                          },)
                        ],),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
