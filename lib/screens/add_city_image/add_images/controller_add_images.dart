import 'package:civic_force/data_source/upload_to_s3.dart';
import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/screens/analysis_screen/controller_analysis.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../project_modules/city/near_by_city/controller_near_by_city.dart';

class ControllerAddImages extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  dynamic selectedImage;
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  @override
  void onInit() {
    super.onInit();
  }
  putData({id,isCity}) async {
    apiResponse=ApiResponse(status: Status.LOADING);
    update();

    try{
      if(selectedImage==null && textEditingController.text.isEmpty ) showToast("Select image");
      var url="";
      if(selectedImage!=null){
        url=await uploadImageToS3(selectedImage);
      }
      if(textEditingController.text.isNotEmpty){
        url=textEditingController.text;
      }
      String endPoint=AppUrls.tags;
      if(isCity==true){
        endPoint=AppUrls.city;
      }
      var res=await NetworkManager().put(endPoint,data: {
        "id":"$id",
        "image":url
      });
      print(res);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);


        try{
          if(isCity==true){
            ControllerNearByCity controllerNearByCity=Get.find();
            var index=controllerNearByCity.list.indexWhere((test)=>"${test.id}"=="$id");
            if(index!= -1){
              controllerNearByCity.list[index].setImage=url;
              controllerNearByCity.update();
            }
          }else{
            ControllerAnalysis controllerAnalysis=Get.find();
            int index=controllerAnalysis.list.indexWhere((test)=>"${test.id}"=="$id");
            if(index!= -1){
              controllerAnalysis.list[index].setImage=url;
              controllerAnalysis.update();
            }
          }
        }catch(e){}

        Get.back(result: url);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){}
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();

  }
}