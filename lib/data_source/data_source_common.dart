
import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class DataSourceCommon {
  retweetFunction(retweetId) async {
    try{
      var res=await NetworkManager().post(AppUrls.post,data:{
        "retweeted_post": "$retweetId"
      });
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        Get.back();
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("Something went wrong");
    }
  }
}