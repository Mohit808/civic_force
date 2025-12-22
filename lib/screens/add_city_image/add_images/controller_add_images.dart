import 'package:civic_force/data_source/upload_to_s3.dart';
import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/screens/analysis_screen/controller_analysis.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerAddImages extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  dynamic selectedImage;
  @override
  void onInit() {
    super.onInit();
  }
  putData({id}) async {

    try{
      if(selectedImage==null && textEditingController.text.isEmpty ) showToast("Select image");
      var url="";
      if(selectedImage!=null){
        url=await uploadImageToS3(selectedImage);
      }
      if(textEditingController.text.isNotEmpty){
        url=textEditingController.text;
      }
      var res=await NetworkManager().put(AppUrls.tags,data: {
        "id":"$id",
        "image":url
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        ControllerAnalysis controllerAnalysis=Get.find();
        int index=controllerAnalysis.list.indexWhere((test)=>"${test.id}"=="$id");
        if(index!= -1){
          controllerAnalysis.list[index].setImage=url;
          controllerAnalysis.update();
        }
        Get.back();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}

  }
}