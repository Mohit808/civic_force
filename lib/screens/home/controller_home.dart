import 'package:civic_force/model/post_model.dart';
import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';

class ControllerHome extends GetxController{
  bool layoutChanged=true;
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppUrls.post);
      PostModel postModel=PostModel.fromJson(res);
      list.addAll(postModel.data!);
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }
}