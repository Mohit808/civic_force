import 'package:civic_force/model/model_x.dart';
import 'package:civic_force/model/other_user_info_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import '../../model/post_model.dart' as pm;

class ControllerUserProfile extends GetxController{
  int selectedTab=0;
  dynamic userId;
  List<pm.Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseFollow=ApiResponse(status: Status.INITIAL);
  OtherUserInfoModel? otherUserInfoModel;


  ControllerUserProfile({this.userId});
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  refreshData(){
    apiResponse=ApiResponse(status: Status.LOADING);
    list=[];
    update();
    fetchData();
  }
  fetchData() async {
    try{
      String filter="";
      if(selectedTab==1) filter="media";
      if(selectedTab==2) filter="tag";
      var res=await NetworkManager().get("${AppUrls.userInfo}?user_id=$userId&filter=$filter");
      otherUserInfoModel=OtherUserInfoModel.fromJson(res);
      list.addAll(otherUserInfoModel?.data?.posts??[]);
    }catch(e){
      print(e);
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }

  postFollow() async {
    apiResponseFollow=ApiResponse(status: Status.LOADING);
    update();
    var res=await NetworkManager().post(AppUrls.follow,data: {
      "user_id":"$userId"
    });
    print(res);
    ModelX modelX=ModelX.fromJson(res);
    if(modelX.status==200){
      showToastSuccess(modelX.message);
      otherUserInfoModel!.data!.isFollowing=modelX.data['following'];
    }else{
      showToastError(modelX.message);
    }
    apiResponseFollow=ApiResponse(status: Status.COMPLETED);
    update();
  }
}