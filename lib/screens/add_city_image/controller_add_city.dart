import 'package:civic_force/network_handling/api_response.dart';
import 'package:civic_force/network_handling/network_manager.dart';
import 'package:civic_force/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/city_model.dart';

class ControllerAddCity extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  RefreshController refreshController=RefreshController();
  bool loadMore=false;
  int page=1;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppUrls.city}?page=$page");
      CityModel cityModel=CityModel.fromJson(res);
      list.addAll(cityModel.data??[]);
      if(cityModel.data?.length==10){
        page++;
        loadMore=true;
      }else{
        loadMore=false;
      }
    }catch(e){}
    apiResponse = ApiResponse(status: Status.COMPLETED);
    update();
    refreshController.loadComplete();
    refreshController.refreshCompleted();

  }
}